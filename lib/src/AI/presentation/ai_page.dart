import 'package:baegopa/core/router/bottomnavbar.dart';
import 'package:flutter/material.dart';

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ai')),
      body: const Center(child: Text('업데이트 중입니다.')),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
