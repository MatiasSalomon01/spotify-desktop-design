import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../overrides/custom_slider_track_shape.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double padding;
  final ValueChanged<double> onChanged;
  final double? width;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.padding = 2,
    this.width,
  });

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  bool isHover = false;
  bool isChanging = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.only(top: widget.padding),
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
            onChanged: widget.onChanged,
            onChangeStart: (value) => isChanging = true,
            onChangeEnd: (value) => isChanging = false,
            value: widget.value,
          ),
        ),
      ),
    );
  }
}
