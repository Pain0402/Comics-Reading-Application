import 'package:mycomicsapp/features/home/presentation/screens/home_screen.dart';
import 'package:mycomicsapp/presentation/screens/splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// Provider that creates and provides the GoRouter instance.
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    debugLogDiagnostics: true, // Log routing diagnostics in debug mode.
    routes: [
      // Splash screen route
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Home screen route
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),

      // We will add authentication and other routes later.
    ],

    // Redirect logic will be added here later to handle authentication.
    redirect: (context, state) {
      // For now, after 2 seconds on splash, go to home.
      // This is temporary until auth logic is in place.
      if (state.matchedLocation == '/splash') {
        return Future.delayed(const Duration(seconds: 2), () => '/home');
      }
      return null;
    },
  );
});

