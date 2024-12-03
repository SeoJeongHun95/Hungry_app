import 'package:flutter/material.dart';

import '../../../core/router/bottom_nav_bar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('통계'),
        centerTitle: false,
      ),
      body: const Center(child: Text('업데이트 예정 입니다.')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
