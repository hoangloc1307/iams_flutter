import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/auth/screens/login_screen.dart';
import '../ui/auth/screens/splash_screen.dart';
import '../ui/auth/view_model/auth_view_model.dart';
import '../ui/home/screens/home_screen.dart';
import 'routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authViewModelProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    redirect: (BuildContext context, GoRouterState state) {
      final onSplash = state.matchedLocation == Routes.splash;
      final onLogin = state.matchedLocation == Routes.login;

      if (auth.isLoading) return onSplash ? null : Routes.splash;

      if (auth.isAuthenticated) {
        if (onSplash || onLogin) return Routes.home;
        return null;
      } else {
        return onLogin ? null : Routes.login;
      }
    },
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    ],
  );
});
