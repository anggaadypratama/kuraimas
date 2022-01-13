import 'package:flutter/material.dart';

class AccSVG extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Color(0xffF89235);
    path = Path();
    path.lineTo(size.width * 0.15, size.height * 0.45);
    path.cubicTo(size.width * 0.05, size.height * 0.42, size.width * 0.01,
        size.height * 0.14, 0, size.height * 0.01);
    path.cubicTo(0, size.height * 0.01, size.width * 0.93, -0.14,
        size.width * 0.93, -0.14);
    path.cubicTo(size.width * 0.93, -0.14, size.width, size.height * 0.74,
        size.width, size.height * 0.74);
    path.cubicTo(size.width * 0.88, size.height * 0.83, size.width * 0.61,
        size.height * 0.96, size.width * 0.53, size.height * 0.74);
    path.cubicTo(size.width * 0.44, size.height * 0.47, size.width * 0.27,
        size.height / 2, size.width * 0.15, size.height * 0.45);
    path.cubicTo(size.width * 0.15, size.height * 0.45, size.width * 0.15,
        size.height * 0.45, size.width * 0.15, size.height * 0.45);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
