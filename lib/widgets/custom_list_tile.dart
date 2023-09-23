import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/values.dart';

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
    final size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: minimalPadding + 12),
        leading: TooltipVisibility(
          visible: size.width < 1033 ? true : false,
          child: Tooltip(
            message: widget.title,
            child: Icon(
              widget.icon,
              size: 25,
              color: size.width < 1033
                  ? white
                  : isHover
                      ? white
                      : greyText,
            ),
          ),
        ),
        title: size.width <= 1033
            ? null
            : Text(
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
