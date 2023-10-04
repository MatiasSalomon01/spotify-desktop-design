import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/bottom_bar.dart';

class FullScreen extends StatelessWidget {
  final Color color;
  const FullScreen({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          Positioned(
            child: CustomIconButton(
              icon: FontAwesomeIcons.downLeftAndUpRightToCenter,
              tip: '',
              size: 20,
              onTap: () => Navigator.of(context).pop(),
            ),
          )
        ],
      ),
    );
  }
}
