import 'package:firebase_app/data/join_or_login.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  final bool isJoin;

  LoginBackground({required this.isJoin});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin? Colors.red : Colors.blue;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0), size.height * 0.7, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}