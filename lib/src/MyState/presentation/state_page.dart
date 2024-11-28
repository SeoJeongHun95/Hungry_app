import 'package:baegopa/core/router/bottomnavbar.dart';
import 'package:flutter/material.dart';

class StatePage extends StatelessWidget {
  const StatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('State')),
      body: const Center(child: Text('State Page')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
