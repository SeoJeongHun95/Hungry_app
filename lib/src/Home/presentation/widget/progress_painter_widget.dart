import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:baegopa/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progress;
  final ui.Image? image;
  final double imageSize;

  ProgressPainter({required this.progress, this.image, this.imageSize = 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 10.0;

    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = AppColor.KongBlue1
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // 반원의 높이만큼 영역 제한
    final clipRect = Rect.fromLTRB(0, 0, size.width, size.height / 2);
    canvas.clipRect(clipRect); // 클리핑 처리

    // 원호 그리기
    final rect = Rect.fromLTWH(
      strokeWidth / 2,
      strokeWidth / 2,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );

    canvas.drawArc(
      rect,
      -math.pi,
      math.pi,
      false,
      paint,
    );

    // 진행된 부분 그리기
    canvas.drawArc(
      rect,
      -math.pi,
      math.pi * progress,
      false,
      progressPaint,
    );

    // 파란색 진행 끝에 이미지 추가
    if (image != null && progress > 0) {
      final angle = -math.pi + math.pi * progress;
      final center = Offset(size.width / 2, size.height / 2);
      final radius = (size.width - strokeWidth) / 2;

      final imageX = center.dx + radius * math.cos(angle) - (imageSize / 2);
      final imageY = center.dy + radius * math.sin(angle) - (imageSize / 2);

      final srcRect = Rect.fromLTWH(
          0, 0, image!.width.toDouble(), image!.height.toDouble());
      final dstRect = Rect.fromLTWH(imageX, imageY, imageSize, imageSize);

      canvas.drawImageRect(image!, srcRect, dstRect, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
