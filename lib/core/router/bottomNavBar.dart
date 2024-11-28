import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      selectedItemColor: AppColor.KongBlue1, // 선택된 아이템 색상
      unselectedItemColor: AppColor.KongGray1, // 선택되지 않은 아이템 색상
      enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      currentIndex: _getCurrentIndex(context),
      onTap: (index) {
        switch (index) {
          case 0:
            context.go('/home');
            break;
          case 1:
            context.go('/state');
            break;
          case 2:
            context.go('/ai');
            break;
          case 3:
            context.go('/profile');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_one),
          label: '단식',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_two),
          label: '상태',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_3),
          label: 'AI',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.looks_4),
          label: '프로필',
        ),
      ],
    );
  }

  int _getCurrentIndex(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();
    switch (currentPath) {
      case '/home':
        return 0;
      case '/state':
        return 1;
      case '/ai':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }
}
