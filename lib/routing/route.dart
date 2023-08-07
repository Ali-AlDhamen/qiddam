import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qiddam/features/post/view/challenges_screen.dart';
import 'package:qiddam/features/profile/view/profile_screen.dart';

import '../features/home/view/home_screen.dart';
import '../features/profile/view/challenge_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'profile');

final routeProvier = Provider<GoRouter>((ref) {
  // final auth = ref.watch(authRepositoryProvider);

  return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      // refreshListenable: GoRouterRefreshStream(auth.authStateChange),
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
                        return  ChallengeScreen(challengeId: id);
                      },
                    ),
                  ]
                ),
              ],
            ),
          ],
        ),
      ]);
});
