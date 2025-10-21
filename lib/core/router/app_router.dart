import 'package:mycomicsapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:mycomicsapp/features/auth/presentation/screens/login_screen.dart';
import 'package:mycomicsapp/features/auth/presentation/screens/signup_screen.dart';
import 'package:mycomicsapp/features/home/domain/entities/story.dart';
import 'package:mycomicsapp/features/home/presentation/screens/home_screen.dart';
import 'package:mycomicsapp/features/home/presentation/screens/story_details_screen.dart';
import 'package:mycomicsapp/features/library/presentation/screens/library_screen.dart';
import 'package:mycomicsapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:mycomicsapp/presentation/screens/scaffold_with_nav_bar.dart';
import 'package:mycomicsapp/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// (navigator keys are unchanged)
final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),

      // UPDATE: ADDED the route for story details screen.
      // It is a top-level route because it can be accessed from multiple tabs.
      GoRoute(
        path: '/story/:storyId',
        builder: (context, state) {
          final storyId = state.pathParameters['storyId']!;
          // The Story object is passed as an 'extra' for the Hero animation.
          final story = state.extra as Story?;
          return StoryDetailsScreen(storyId: storyId, story: story);
        },
      ),

      // (StatefulShellRoute is unchanged)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/library',
                builder: (context, state) => const LibraryScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    // (redirect logic is unchanged)
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) {
        return null;
      }
      final isLoggedIn = authState.valueOrNull != null;
      final location = state.matchedLocation;
      final isAtSplash = location == '/splash';
      final isAtAuthScreen = location == '/login' || location == '/signup';

      if (isAtSplash) {
        return isLoggedIn ? '/home' : '/login';
      }
      if (isLoggedIn && isAtAuthScreen) {
        return '/home';
      }
      if (!isLoggedIn && !isAtAuthScreen) {
        return '/login';
      }
      return null;
    },
  );
});

