import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';
import '../constants/values.dart';
import '../overrides/custom_slider_track_shape.dart';
import 'custom_slider.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: minimalPadding),
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

class ExtraButtons extends StatefulWidget {
  const ExtraButtons({
    super.key,
  });

  @override
  State<ExtraButtons> createState() => _ExtraButtonsState();
}

class _ExtraButtonsState extends State<ExtraButtons> {
  double volume = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(),
          const CustomIconButton(icon: Icons.mic, tip: 'Letras', size: 18),
          separateHorizontal(15),
          const CustomIconButton(
            icon: Icons.queue_music_rounded,
            tip: 'Cola de reproduccion',
            size: 22,
          ),
          separateHorizontal(15),
          const CustomIconButton(
            icon: FontAwesomeIcons.computer,
            tip: 'Conectar a un dispositivo',
            size: 15,
          ),
          separateHorizontal(15),
          CustomIconButton(
            icon: volume == 0
                ? FontAwesomeIcons.volumeXmark
                : volume > 0 && volume <= .3
                    ? FontAwesomeIcons.volumeOff
                    : volume >= .3 && volume <= .6
                        ? FontAwesomeIcons.volumeLow
                        : FontAwesomeIcons.volumeHigh,
            tip: 'Sonido',
            size: 15,
          ),
          separateHorizontal(8),
          CustomSlider(
            value: volume,
            onChanged: (value) => setState(() => volume = value),
            padding: 0,
          ),
          separateHorizontal(15),
          const CustomIconButton(
            icon: FontAwesomeIcons.upRightAndDownLeftFromCenter,
            tip: 'Pantalla Completa',
            size: 13,
          ),
          separateHorizontal(15),
          // Icon(
          //   Icons.devices_rounded,
          //   color: greyText,
          // ),
          // Icon(
          //   FontAwesomeIcons.downLeftAndUpRightToCenter,
          //   color: greyText,
          // ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final String tip;
  final double size;
  final bool enableHover;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.tip,
    required this.size,
    this.enableHover = true,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: Tooltip(
        message: widget.tip,
        preferBelow: false,
        textStyle: const TextStyle(
          color: white,
          fontSize: 13.5,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff232323),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          widget.icon,
          color: widget.enableHover
              ? isHover
                  ? white
                  : greyText
              : black,
          size: widget.size,
        ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FunctionalityButtons(),
          separateVertical(8),
          const Progress(),
        ],
      ),
    );
  }
}

class Progress extends StatefulWidget {
  const Progress({
    super.key,
  });

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Row(
        children: [
          const Text(
            '0:00',
            style: TextStyle(
              color: greyText,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
          separateHorizontal(10),
          CustomSlider(
            value: progress,
            onChanged: (value) => setState(() => progress = value),
          ),
          separateHorizontal(10),
          const Text(
            '4:12',
            style: TextStyle(
              color: greyText,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

class FunctionalityButtons extends StatelessWidget {
  const FunctionalityButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          CustomIconButton(
            icon: FontAwesomeIcons.shuffle,
            tip: 'Activar reproduccion aleatoria',
            size: 15,
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.backwardStep,
            tip: 'Anterior',
            size: 20,
          ),
          CircleAvatar(
            backgroundColor: white,
            radius: 16,
            child: Center(
              child: CustomIconButton(
                icon: Icons.play_arrow_rounded,
                tip: 'Reproducir',
                size: 28,
                enableHover: false,
              ),
            ),
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.forwardStep,
            tip: 'Siguiente',
            size: 20,
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.repeat,
            tip: 'Activar repeticion',
            size: 15,
          ),
        ],
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
        // color: green,
        padding: const EdgeInsets.only(left: 4, right: 5),
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ClipRRect(
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/flutter-music-player-9518c.appspot.com/o/images%2FSodaCanci.jpg?alt=media&token=710953c8-7801-4647-8a24-ce69974b55a6&_gl=1*1vam2uq*_ga*MjA3NjE3OTM0NC4xNjc3NDIxNDM3*_ga_CW55HF8NVT*MTY5NjIwODkzOC45LjEuMTY5NjIwODk2Mi4zNi4wLjA.',
                height: 55,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  return Container(
                    height: 55,
                    width: 57,
                    decoration: BoxDecoration(
                      color: greyText.withOpacity(.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: child,
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: minimalPadding + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 240,
                    child: Text(
                      'Entre Caníbales - Remasterizado 2007',
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  separateVertical(2),
                  const Text(
                    'Soda Stereo',
                    style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w500,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            separateHorizontal(8),
            const Icon(
              Icons.favorite,
              color: green,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
