import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src/AI/presentation/ai_page.dart';
import '../../src/Home/presentation/view/home_page.dart';
import '../../src/Home/presentation/view/tip_page.dart';
import '../../src/MySetting/presentation/setting_page.dart';
import '../../src/Statistics/presentation/view/statistics_page.dart';

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
          routes: [
            GoRoute(
              name: "TipPage",
              path: '/home/Tip',
              pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context,
                state: state,
                child: const TipPage(),
              ),
            ),
          ]),
      GoRoute(
        path: '/statistics',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const StatisticsPage(),
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
        path: '/setting',
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: const SettingPage(),
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
