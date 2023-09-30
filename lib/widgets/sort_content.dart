import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class SortContent extends StatefulWidget {
  const SortContent({
    super.key,
  });

  @override
  State<SortContent> createState() => _SortContentState();
}

class _SortContentState extends State<SortContent> {
  int valueSelected = 1;
  String? text = '';
  bool orderByDesc = false;
  bool isOpen = false;

  final Map<int, String> options = {
    1: 'Fecha en que se agrego',
    2: 'Titulo',
    3: 'Artista',
    4: 'Album'
  };

  @override
  void initState() {
    text = options[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        highlightColor: tranparent,
        hoverColor: const Color(0xff3e3e3e),
        splashFactory: NoSplash.splashFactory,
      ),
      child: PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        tooltip: '',
        offset: const Offset(0, 40),
        color: const Color(0xff282828),
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(maxWidth: 215),
        surfaceTintColor: green,
        onOpened: () => setState(() => isOpen = !isOpen),
        onSelected: onSelected,
        itemBuilder: (context) => items,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text!,
              style: const TextStyle(
                color: white,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              !isOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              color: white,
            )
          ],
        ),
      ),
    );
  }

  List<PopupMenuItem<int>> get items {
    return [
      PopupMenuItem(
        value: 1,
        height: 40,
        child: Row(
          children: [
            Text(
              'Fecha en que se agrego',
              style: TextStyle(
                fontSize: 14,
                color: valueSelected == 1 ? green : white,
                fontWeight:
                    valueSelected == 1 ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            if (valueSelected == 1) ...[
              separateHorizontal(10),
              Icon(
                orderByDesc
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: valueSelected == 1 ? green : white,
                size: 20,
              )
            ]
          ],
        ),
      ),
      PopupMenuItem(
        value: 2,
        height: 40,
        child: Row(
          children: [
            Text(
              'Titulo',
              style: TextStyle(
                fontSize: 14,
                color: valueSelected == 2 ? green : white,
                fontWeight:
                    valueSelected == 2 ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            if (valueSelected == 2) ...[
              separateHorizontal(10),
              Icon(
                orderByDesc
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: valueSelected == 2 ? green : white,
                size: 20,
              ),
            ]
          ],
        ),
      ),
      PopupMenuItem(
        value: 3,
        height: 40,
        child: Row(
          children: [
            Text(
              'Artista',
              style: TextStyle(
                fontSize: 14,
                color: valueSelected == 3 ? green : white,
                fontWeight:
                    valueSelected == 3 ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            if (valueSelected == 3) ...[
              separateHorizontal(10),
              Icon(
                orderByDesc
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: valueSelected == 3 ? green : white,
                size: 20,
              )
            ]
          ],
        ),
      ),
      PopupMenuItem(
        value: 4,
        height: 40,
        child: Row(
          children: [
            Text(
              'Album',
              style: TextStyle(
                fontSize: 14,
                color: valueSelected == 4 ? green : white,
                fontWeight:
                    valueSelected == 4 ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            if (valueSelected == 4) ...[
              separateHorizontal(10),
              Icon(
                orderByDesc
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: valueSelected == 4 ? green : white,
                size: 20,
              )
            ]
          ],
        ),
      ),
    ];
  }

  void onSelected(int value) {
    if (value == valueSelected) {
      orderByDesc = !orderByDesc;
    }

    valueSelected = value;
    text = options[value];
    isOpen = !isOpen;
    setState(() {});
  }
}
