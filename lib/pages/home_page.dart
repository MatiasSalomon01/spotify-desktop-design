import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/colors.dart';
import 'package:spotify_desktop/constants/values.dart';
import 'package:spotify_desktop/widgets/mote_button.dart';

import '../widgets/left_side.dart';
import '../widgets/middle_side.dart';
import '../widgets/right_side.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double headerHeight = 40;
    return Scaffold(
      backgroundColor: black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MoreButton(headerHeight: headerHeight),
              Expanded(
                child: Row(
                  children: const [
                    LeftSide(),
                    MiddleSide(),
                    RightSide(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
