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

  List<Widget> generateRows2(Size size) {
    List<Widget> widgets = [];

    for (var i = 0; i < data2.length; i++) {
      var widget = Container(
        width: size.width,
        padding: const EdgeInsets.only(
          left: minimalPadding * 4,
          right: minimalPadding * 8,
          bottom: 10,
        ),
        child: Container(
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 40,
                child: Text(
                  '${i + 1}',
                  style: const TextStyle(
                    color: greyText,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  // color: green,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: ClipRRect(
                          child: Image.network(
                            data2[i].url,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: minimalPadding + 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                data2[i].title,
                                maxLines: 1,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              separateVertical(5),
                              Text(
                                data2[i].subTitle,
                                style: const TextStyle(
                                  color: greyText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (size.width > 715)
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(right: minimalPadding),
                    color: tranparent,
                    child: Text(
                      data2[i].subTitle,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: greyText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              if (size.width > 925)
                Expanded(
                  flex: 4,
                  child: Container(
                    color: tranparent,
                    child: Text(
                      data2[i].addedDate,
                      style: const TextStyle(
                        color: greyText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  // color: green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: green,
                        size: 18,
                      ),
                      Text(
                        data2[i].played,
                        style: const TextStyle(
                          color: greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      widgets.add(widget);
    }

    return widgets;
  }
}

enum Routes { home, search }
