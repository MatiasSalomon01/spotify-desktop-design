import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: minimalPadding * 9,
        color: black,
      ),
    );
  }
}
