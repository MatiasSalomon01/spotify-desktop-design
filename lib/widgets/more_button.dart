import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/values.dart';
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
        child: Row(
          children: [
            IconButton(
              splashColor: tranparent,
              splashRadius: .1,
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_outlined, color: white),
            ),
            Text(
              "Screen width: ${MediaQuery.of(context).size.width}",
              style: const TextStyle(color: white),
            ),
            const VerticalDivider(
              color: white,
              endIndent: 10,
              indent: 10,
            ),
            Text(
              "Screen height: ${MediaQuery.of(context).size.height}",
              style: const TextStyle(color: white),
            )
          ],
        ),
      ),
    );
  }
}
