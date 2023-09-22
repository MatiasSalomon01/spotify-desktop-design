import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.headerHeight,
  });

  final double headerHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: headerHeight,
      child: IconButton(
        splashColor: tranparent,
        splashRadius: .1,
        onPressed: () {},
        icon: const Icon(Icons.more_horiz_outlined, color: white),
      ),
    );
  }
}
