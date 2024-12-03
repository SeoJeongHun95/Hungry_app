import 'package:flutter/material.dart';

class TipPage extends StatelessWidget {
  const TipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("작은 팁!"),
      ),
      body: const SafeArea(
          child: Center(
        child: Text("업데이트 예정 입니다."),
      )),
    );
  }
}
