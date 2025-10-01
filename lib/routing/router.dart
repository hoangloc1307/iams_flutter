import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iams_fe/routing/routes.dart';
import 'package:iams_fe/ui/assets/screens/asset_screen.dart';
import 'package:iams_fe/ui/auth/screens/login_screen.dart';
import 'package:iams_fe/ui/auth/screens/splash_screen.dart';
import 'package:iams_fe/ui/auth/view_model/auth_view_model.dart';
import 'package:iams_fe/ui/home/screens/home_screen.dart';
import 'package:iams_fe/ui/layout/master_layout.dart';
import 'package:iams_fe/ui/posts/screens/post_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final auth = ref.watch(authViewModelProvider);

  return GoRouter(
    // Route đầu tiên sẽ vào khi mở ứng dụng
    initialLocation: Routes.login,

    // Check login chưa
    redirect: (BuildContext context, GoRouterState state) {
      final onSplash = state.matchedLocation == Routes.splash;
      final onLogin = state.matchedLocation == Routes.login;

      // Load màn hình splash khi chưa init app xong
      if (!auth.initialized) return onSplash ? null : Routes.splash;

      if (auth.isAuthenticated) {
        if (onSplash || onLogin) return Routes.home;
        return null;
      } else {
        return onLogin ? null : Routes.login;
      }
    },

    // App routes
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      ShellRoute(
        builder: (context, state, child) => MasterLayout(child: child),
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: Routes.assets,
            builder: (context, state) => const AssetsScreen(),
          ),
          GoRoute(
            path: Routes.posts,
            builder: (context, state) => const PostListScreen(),
          ),
        ],
      ),
    ],
  );
}
