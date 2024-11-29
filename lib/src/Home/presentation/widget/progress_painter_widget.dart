import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_color.dart';

class ProgressPainter extends CustomPainter {
  final double progress; // 진행 상태를 받음
  final ui.Image? image;
  final double imageSize;
  final double strokeWidth;

  ProgressPainter({
    required this.progress,
    this.image,
    required this.imageSize,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 부모 위젯의 크기를 초과하지 않도록 원의 크기를 조정
    final radius = math.min(size.width, size.height) / 2 - strokeWidth;

    final paint = Paint()
      ..color = AppColor.KongBlue5
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // 원 그리기
    canvas.drawCircle(size.center(Offset.zero), radius, paint);

    // 진행 상태 원 그리기
    final sweepAngle = 2 * math.pi * progress;
    paint
      ..color = AppColor.KongBlue1
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
      -math.pi / 2, // 시작 각도 (상단부터 시작)
      sweepAngle, // 진행된 각도
      false,
      paint,
    );

    // 이미지 추가 (진행 상태 끝에 이미지 그리기)
    if (image != null && progress > 0) {
      final angle = -math.pi / 2 + 2 * math.pi * progress; // 진행 각도
      final center = Offset(size.width / 2, size.height / 2);
      final imageRadius = radius; // 이미지도 원의 경계에 맞추어 배치

      final imageX =
          center.dx + imageRadius * math.cos(angle) - (imageSize / 2);
      final imageY =
          center.dy + imageRadius * math.sin(angle) - (imageSize / 2);

      final srcRect = Rect.fromLTWH(
          0, 0, image!.width.toDouble(), image!.height.toDouble());
      final dstRect = Rect.fromLTWH(imageX, imageY, imageSize, imageSize);

      canvas.drawImageRect(image!, srcRect, dstRect, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 상태 변경 시 계속 그려짐
  }
}
