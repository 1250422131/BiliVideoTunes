import 'dart:math';


import 'package:flutter/material.dart';


class WaveCirclePainter extends CustomPainter {
  final int waveCount;
  final double amplitude;
  final double frequency;
  final Color color;

  WaveCirclePainter({
    this.waveCount = 12,
    this.amplitude = 10.0,
    this.frequency = 1.0,
    this.color = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final path = Path();

    for (int i = 0; i < waveCount; i++) {
      final startAngle = 2 * pi * i / waveCount;
      final endAngle = 2 * pi * (i + 1) / waveCount;
      final midAngle = (startAngle + endAngle) / 2;

      final startX = center.dx + radius * cos(startAngle);
      final startY = center.dy + radius * sin(startAngle);
      final endX = center.dx + radius * cos(endAngle);
      final endY = center.dy + radius * sin(endAngle);
      final midX = center.dx + (radius + amplitude * sin(frequency * i)) * cos(midAngle);
      final midY = center.dy + (radius + amplitude * sin(frequency * i)) * sin(midAngle);

      if (i == 0) {
        path.moveTo(startX, startY);
      } else {
        path.lineTo(startX, startY);
      }
      path.quadraticBezierTo(midX, midY, endX, endY);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveCirclePainter oldDelegate) => false;
}