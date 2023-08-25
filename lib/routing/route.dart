import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:qiddam/features/auth/repository/auth_repository.dart';
import 'package:qiddam/features/challenge/view/challenges_screen.dart';
import 'package:qiddam/features/profile/view/profile_screen.dart';
import 'package:qiddam/features/profile/view/update_profile_screen.dart';
import 'package:qiddam/routing/not_found_screen.dart';

import '../features/auth/controller/auth_controller.dart';
import '../features/auth/view/signin_screen.dart';
import '../features/auth/view/signup_screen.dart';
import '../features/challenge/view/challenge_screen.dart';
import '../features/challenge/view/create_challenge_screen.dart';
import '../features/home/view/home_screen.dart';
import 'go_router_refresh_stream.dart';

part 'route.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
  final shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'profile');

  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ref.read(authControllerProvider.notifier).initalPath(),
    navigatorKey: rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authRepositoryProvider).authStateChange,
    ),
    redirectLimit: 2,
    redirect: (context, state) {
      final path = state.uri.path;
      final userIsLogging = path == '/signin' || path == '/signup';
      final userIsLoggedIn =
          ref.read(authRepositoryProvider).currentUser != null;

      if (userIsLogging && userIsLoggedIn) {
        return '/home';
      } else if (!userIsLogging && !userIsLoggedIn) {
        return '/signin';
      } else {
        return null;
      }
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) {
                  return const ChallengesScreen();
                },
                routes: [
                  GoRoute(
                    path: 'challenge/:id',
                    builder: (context, state) {
                      final String id = state.pathParameters['id']!;
                      return ChallengeScreen(challengeId: id);
                    },
                  ),
                  GoRoute(
                    path: 'create-challenge',
                    pageBuilder: (context, state) {
                      return const MaterialPage(
                        fullscreenDialog: true,
                        child: CreateChallengeScreen(),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'profile/:id',
                    builder: (context, state) {
                      final String id = state.pathParameters['id']!;
                      return ProfileScreen(id: id);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) {
                  return const ProfileScreen();
                },
                routes: [
                  GoRoute(
                    path: 'challenge/:id',
                    builder: (context, state) {
                      final String id = state.pathParameters['id']!;
                      return ChallengeScreen(challengeId: id);
                    },
                  ),
                  GoRoute(
                    name: "update",
                    path: 'update',
                    builder: (context, state) {
                      return const UpdateProfileScreen();
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
