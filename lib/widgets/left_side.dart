import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: grey,
      margin: const EdgeInsets.only(left: minimalPadding),
    ));
  }
}
