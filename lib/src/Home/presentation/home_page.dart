import 'package:flutter/material.dart';

import '../../../core/router/bottomNavBar.dart';
import 'widget/baegopa_timer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: BaegopaTimerWidget()),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
