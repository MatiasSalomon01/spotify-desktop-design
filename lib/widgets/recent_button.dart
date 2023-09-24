import 'package:flutter/material.dart';

import '../constants/colors.dart';

class RecentButton extends StatefulWidget {
  const RecentButton({
    super.key,
  });

  @override
  State<RecentButton> createState() => _RecentButtonState();
}

class _RecentButtonState extends State<RecentButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recientes',
            style: TextStyle(
              color: isHover ? white : greyText,
              fontWeight: FontWeight.w400,
              fontSize: isHover ? 14.25 : 14,
            ),
          ),
          Icon(
            Icons.more_vert,
            color: isHover ? white : greyText,
            size: isHover ? 21 : 20,
          )
        ],
      ),
    );
  }
}
