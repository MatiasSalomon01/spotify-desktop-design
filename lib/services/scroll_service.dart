import 'package:flutter/material.dart';

class ScrollService extends ChangeNotifier {
  bool _isScrolling = false;

  bool get isScrolling => _isScrolling;

  set isScrolling(bool value) {
    _isScrolling = value;
    notifyListeners();
  }
}
