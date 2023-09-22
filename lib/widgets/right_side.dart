import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: minimalPadding),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
