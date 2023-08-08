import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/features/challenge/view/challenges_screen.dart';
import 'package:qiddam/features/profile/view/profile_screen.dart';
import 'package:qiddam/features/profile/view/update_profile_screen.dart';

import '../features/auth/controller/auth_controller.dart';
import '../features/auth/view/signin_screen.dart';
import '../features/auth/view/signup_screen.dart';
import '../features/challenge/view/create_challenge_screen.dart';
import '../features/home/view/home_screen.dart';
import '../features/challenge/view/challenge_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');

final routeProvier = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: ref.read(authControllerProvider.notifier).initalPath(),
      navigatorKey: _rootNavigatorKey,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            // the UI shell
            return HomeScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _shellNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: '/',
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
                        return MaterialPage(
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
              navigatorKey: _shellNavigatorProfileKey,
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
                    // update profile
                    GoRoute(
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
      redirect: (context, state) {
        final userIsLogging = state.uri.toString() == '/signin' ||
            state.uri.toString() == '/signup';
        bool userIsLoggedIn = false;
        ref.watch(authStateChangeProvider).whenData((value) {
          userIsLoggedIn = value != null;
        });

        if (userIsLogging && userIsLoggedIn) {
          return '/';
        } else if (!userIsLogging && !userIsLoggedIn) {
          return '/signin';
        } else {
          return null;
        }
      },
    );
  },
);
