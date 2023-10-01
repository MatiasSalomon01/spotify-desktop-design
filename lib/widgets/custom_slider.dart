import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../overrides/custom_slider_track_shape.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double slide = 0;
  bool isHover = false;
  bool isChanging = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 2),
        child: MouseRegion(
          onEnter: (event) => setState(() => isHover = true),
          onExit: (event) => setState(() => isHover = false),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              trackShape: CustomSliderTrackShape(),
              thumbColor: isHover || isChanging ? white : tranparent,
              activeTrackColor: isHover || isChanging ? green : white,
              inactiveTrackColor: const Color(0xff4d4d4d),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: isHover || isChanging ? 6 : 6,
              ),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              onChanged: (value) => setState(() => slide = value),
              onChangeStart: (value) => isChanging = true,
              onChangeEnd: (value) => isChanging = false,
              value: slide,
            ),
          ),
        ),
      ),
    );
  }
}
