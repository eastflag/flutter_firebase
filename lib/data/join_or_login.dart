import 'package:flutter/material.dart';

class JoinOrLogin extends ChangeNotifier {
  bool _isJoin = true;

  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners();
  }
}