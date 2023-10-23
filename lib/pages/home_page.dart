import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/constants/colors.dart';
import 'package:spotify_desktop/constants/values.dart';
import 'package:spotify_desktop/widgets/bottom_bar.dart';
import 'package:spotify_desktop/widgets/more_button.dart';

import '../services/general_service.dart';
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
    final service = Provider.of<GeneralService>(context);
    return Scaffold(
      backgroundColor: black,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            margin: const EdgeInsets.only(top: minimalPadding - 2),
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    LeftSide(),
                    MiddleSide(),
                    // if (!service.hideRightSide && constraints.maxWidth > 1297)
                    //   const RightSide(),
                  ],
                ),
                const MoreButton(headerHeight: headerHeight),
                const BottomBar()
              ],
            ),
          );
        },
      ),
    );
  }
}
