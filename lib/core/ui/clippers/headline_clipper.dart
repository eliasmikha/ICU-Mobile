import 'package:flutter/material.dart';

class HeadlineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    final quadraticPointX = width * 0.5;
    final quadraticPointY = height;
    final endPointX = 0.0;
    final endPointY = height * 0.8;

    final path = Path();
    path.lineTo(width, 0);
    path.lineTo(width, height * 0.6);

    path.quadraticBezierTo(
      quadraticPointX,
      quadraticPointY,
      endPointX,
      endPointY,
    );

    path.lineTo(endPointX, endPointY);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
