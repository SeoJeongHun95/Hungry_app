import 'dart:math';

import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final Offset center = Offset(width / 2, height / 2);
    final double radius = min(width / 2, height / 2);

    // 배경 원
    final Paint backgroundPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, backgroundPaint);

    // 진행 중인 원호
    final Paint progressPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final Rect rect = Rect.fromCircle(center: center, radius: radius - 10);

    // 원호 그리기 (시작 각도: -pi/2 (12시 방향))
    canvas.drawArc(
      rect,
      -pi / 2,
      2 * pi * progress, // 진행 상태에 따라 각도를 계산
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
