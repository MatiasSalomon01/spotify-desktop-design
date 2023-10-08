import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/colors.dart';

import '../constants/values.dart';
import '../models/data.dart';
import '../widgets/custom_table_row.dart';

class GeneralService extends ChangeNotifier {
  //General properties for responsiveness and states
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

  //Tables Content

  List<Widget> generateRows(Size size) {
    List<Widget> widgets = [];
    for (var i = 0; i < data2.length; i++) {
      var widget = CustomTableRow(
        index: i,
        size: size,
        data: data2[i],
      );
      widgets.add(widget);
    }

    return widgets;
  }

  //Song selected
  Data? _currentSong;

  Data? get currentSong => _currentSong;

  set currentSong(Data? value) {
    _currentSong = value;
    notifyListeners();
  }
}

enum Routes { home, search }
