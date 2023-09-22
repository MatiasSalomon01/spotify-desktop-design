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
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: SizedBox(
        height: headerHeight - 5,
        child: IconButton(
          splashColor: tranparent,
          splashRadius: .1,
          onPressed: () {
            print(MediaQuery.of(context).size.width);
          },
          icon: const Icon(Icons.more_horiz_outlined, color: white),
        ),
      ),
    );
  }
}
