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

  bool _isLibraryExpanded = false;

  bool get isLibraryExpanded => _isLibraryExpanded;

  set isLibraryExpanded(bool value) {
    _isLibraryExpanded = value;
    notifyListeners();
  }

  bool _isLibraryMin = false;

  bool get isLibraryMin => _isLibraryMin;

  set isLibraryMin(bool value) {
    _isLibraryMin = value;
    notifyListeners();
  }

  bool _hideRightSide = false;

  bool get hideRightSide => _hideRightSide;

  set hideRightSide(bool value) {
    _hideRightSide = value;
    notifyListeners();
  }
}

enum Routes { home, search }
