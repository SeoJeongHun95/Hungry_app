import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src/AI/presentation/ai_page.dart';
import '../../src/Home/presentation/view/home_page.dart';
import '../../src/MyProfile/presentation/profile_page.dart';
import '../../src/MyState/presentation/state_page.dart';

final goRouteProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        path: '/state',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const StatePage(),
        ),
      ),
      GoRoute(
        path: '/ai',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const AiPage(),
        ),
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const ProfilePage(),
        ),
      ),
    ],
  );
});

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
