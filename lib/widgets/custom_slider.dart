import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../overrides/custom_slider_track_shape.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double padding;
  final ValueChanged<double> onChanged;
  final double? width;
  final double trackHeight;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.padding = 2,
    this.width,
    this.trackHeight = 4,
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
            trackHeight: widget.trackHeight,
            trackShape: CustomSliderTrackShape(),
            thumbColor: isHover || isChanging ? white : tranparent,
            activeTrackColor: isHover || isChanging ? green : white,
            inactiveTrackColor: white.withOpacity(.2),
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: isHover || isChanging ? 6 : 6,
              elevation: 0,
              disabledThumbRadius: 0,
              pressedElevation: 0,
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
