import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width,
        height: minimalPadding * 9,
        color: black,
        child: Row(
          children: const [
            SongContent(),
            Controllers(),
            ExtraButtons(),
          ],
        ),
      ),
    );
  }
}

class ExtraButtons extends StatelessWidget {
  const ExtraButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}

class Controllers extends StatelessWidget {
  const Controllers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

class SongContent extends StatelessWidget {
  const SongContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: green,
      ),
    );
  }
}
