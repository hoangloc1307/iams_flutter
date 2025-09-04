import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../ui/auth/screens/login_screen.dart';
import '../ui/auth/view_model/auth_view_model.dart';
import '../ui/home/screens/home_screen.dart';
import 'routes.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.login,
    redirect: (BuildContext context, GoRouterState state) {
      final auth = ref.watch(authViewModelProvider);
      final loggingIn = state.matchedLocation == Routes.login;

      // Đang “loading” thì không redirect lung tung (có thể show Splash/Loading page)
      if (auth.isLoading) return null;

      if (!auth.isAuthenticated && !loggingIn) {
        return Routes.login;
      }

      if (auth.isAuthenticated && loggingIn) {
        return Routes.home;
      }

      return null;
    },
    routes: [
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      GoRoute(path: Routes.home, builder: (context, state) => HomeScreen()),
    ],
  );
});
