import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tip;
  const CustomMaterialButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tip = '',
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tip,
      child: MaterialButton(
        hoverColor: hoverGrey,
        splashColor: tranparent,
        highlightColor: tranparent,
        elevation: 0,
        shape: const CircleBorder(),
        minWidth: 0,
        padding: const EdgeInsets.all(10),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: greyText,
        ),
      ),
    );
  }
}
