import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomListTile extends StatefulWidget {
  final IconData icon;
  final String title;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: ListTile(
        leading: Icon(
          widget.icon,
          color: isHover ? white : greyText,
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: isHover ? white : greyText,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
