import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/colors.dart';
import 'package:spotify_desktop/widgets/mote_button.dart';

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
          final double height = constraints.maxHeight - headerHeight;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MoreButton(headerHeight: headerHeight),
              Row(
                children: [
                  Container(width: 60, height: height, color: green),
                  Container(width: 60, height: height, color: green),
                  Container(width: 60, height: height, color: green),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
