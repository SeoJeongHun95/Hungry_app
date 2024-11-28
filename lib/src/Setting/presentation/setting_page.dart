import 'package:baegopa/core/router/bottomnavbar.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
        centerTitle: false,
      ),
      body: const Center(child: Text('setting Page')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
