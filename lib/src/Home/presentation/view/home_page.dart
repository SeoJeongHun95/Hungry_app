import 'package:flutter/material.dart';

import '../../../../core/router/bottomnavbar.dart';
import '../widget/baegopa_timer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: BeagopaTimerWidget()),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
