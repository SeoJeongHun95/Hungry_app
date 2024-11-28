import 'package:flutter/material.dart';

import '../../../../core/router/bottomnavbar.dart';
import '../widget/baegopa_timer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("단식"),
        centerTitle: false,
      ),
      body: const Center(child: BeagopaTimerWidget()),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
