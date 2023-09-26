import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tip;
  final Color? color;
  final Widget? child;
  final double padding;
  const CustomMaterialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tip = '',
    this.color,
    this.child,
    this.padding = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tip,
      child: MaterialButton(
        color: color,
        hoverColor: hoverGrey,
        splashColor: tranparent,
        highlightColor: tranparent,
        elevation: 0,
        shape: const CircleBorder(),
        minWidth: 0,
        padding: EdgeInsets.all(padding),
        onPressed: onPressed,
        child: child ??
            Icon(
              icon,
              color: greyText,
            ),
      ),
    );
  }
}
