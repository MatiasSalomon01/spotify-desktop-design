import 'package:flutter/material.dart';

class GeneralService extends ChangeNotifier {
  bool _isScrolling = false;

  bool get isScrolling => _isScrolling;

  set isScrolling(bool value) {
    _isScrolling = value;
    notifyListeners();
  }

  Routes _currentRoute = Routes.home;

  Routes get currentRoute => _currentRoute;

  set currentRoute(Routes value) {
    _currentRoute = value;
    notifyListeners();
  }
}

enum Routes { home, search }
