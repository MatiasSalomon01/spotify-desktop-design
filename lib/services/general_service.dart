import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/colors.dart';

import '../constants/values.dart';
import '../models/data.dart';

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

  List<DataRow> generateRows(Size size) {
    List<DataRow> rows = [];

    for (var i = 0; i < data.length; i++) {
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                '${i + 1}',
                style: const TextStyle(
                  color: greyText,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            DataCell(
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: ClipRRect(
                      child: Image.network(
                        data[i].url,
                        height: 40,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          return Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: greyText.withOpacity(.3),
                            ),
                            child: child,
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: minimalPadding + 5),
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            data[i].title,
                            maxLines: 1,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          // Spacer(),
                          separateVertical(5),
                          Row(
                            children: [
                              Text(
                                data[i].subTitle,
                                style: const TextStyle(
                                  color: greyText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DataCell(
              Text(data[i].subTitle,
                  style: const TextStyle(
                    color: greyText,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            if (size.width > 1141)
              DataCell(
                Text(data[i].addedDate,
                    style: const TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            DataCell(
              Text(data[i].played,
                  style: const TextStyle(
                    color: greyText,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        ),
      );
    }
    return rows;
  }
}

enum Routes { home, search }
