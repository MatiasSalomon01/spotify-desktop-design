import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final IconData icon;
  const CustomMaterialButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverColor: const Color(0xff232323),
      splashColor: tranparent,
      highlightColor: tranparent,
      elevation: 0,
      shape: const CircleBorder(),
      minWidth: 0,
      padding: const EdgeInsets.all(10),
      onPressed: () {},
      child: Icon(
        icon,
        color: greyText,
      ),
    );
  }
}
