import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/constants/values.dart';

import '../constants/colors.dart';
import '../services/general_service.dart';

class CustomListTile extends StatefulWidget {
  final Routes route;
  final IconData icon;
  final String title;
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);

    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: ListTile(
        onTap: () => service.currentRoute = widget.route,
        contentPadding: const EdgeInsets.only(left: minimalPadding + 12),
        leading: TooltipVisibility(
          visible: size.width < 1033 ? true : false,
          child: Tooltip(
            message: widget.title,
            child: Icon(
              widget.icon,
              size: 25,
              color: widget.route == service.currentRoute
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
                  color: widget.route == service.currentRoute
                      ? white
                      : isHover
                          ? white
                          : greyText,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
