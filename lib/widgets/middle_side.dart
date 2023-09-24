import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class MiddleSide extends StatelessWidget {
  const MiddleSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(
          left: minimalPadding,
          right: minimalPadding,
          bottom: minimalPadding,
        ),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(minimalRadius),
        ),
      ),
    );
  }
}
