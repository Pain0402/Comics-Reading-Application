import 'package:mycomicsapp/features/home/presentation/screens/home_screen.dart';
import 'package:mycomicsapp/presentation/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:mycomicsapp/features/auth/presentation/providers/auth_providers.dart';
import 'package:mycomicsapp/features/auth/presentation/screens/login_screen.dart';
import 'package:mycomicsapp/features/auth/presentation/screens/signup_screen.dart';

// Provider that creates and provides the GoRouter instance.
final goRouterProvider = Provider<GoRouter>((ref) {
  // Watch the authentication state to trigger redirects.
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true, // Log routing diagnostics in debug mode.
    routes: [
      // Splash screen route
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      // Auth routes
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      // Home screen route
      GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),

      // We will add authentication and other routes later.
    ],

    // Redirect logic based on authentication state.
    redirect: (context, state) {
      // While the auth state is loading, don't redirect.
      // The user will see the SplashScreen.
      if (authState.isLoading || authState.hasError) {
        return null;
      }

      // Check if the user is logged in.
      final isLoggedIn = authState.valueOrNull != null;

      final location = state.matchedLocation;
      final isAtSplash = location == '/splash';
      final isAtAuthScreen = location == '/login' || location == '/signup';

      // Scenario 1: If on the splash screen, must navigate away.
      if (isAtSplash) {
        return isLoggedIn ? '/home' : '/login';
      }

      // Scenario 2: If logged in, but on an auth screen, go to home.
      if (isLoggedIn && isAtAuthScreen) {
        return '/home';
      }

      // Scenario 3: If not logged in and trying to access a protected page,
      // redirect to login.
      if (!isLoggedIn && !isAtAuthScreen) {
        return '/login';
      }

      // Otherwise, no redirect is needed.
      return null;
    },
  );
});
