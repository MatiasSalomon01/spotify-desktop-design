import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_desktop/pages/full_screen.dart';
import '../constants/colors.dart';
import '../constants/values.dart';
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
          children: [
            const SongContent(),
            const Controllers(),
            ExtraButtons(
              screenIcon: CustomIconButton(
                icon: FontAwesomeIcons.upRightAndDownLeftFromCenter,
                tip: 'Pantalla Completa',
                size: 13,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FullScreen(color: purple),
                    ),
                  );
                },
              ),
            ),
            separateHorizontal(10),
          ],
        ),
      ),
    );
  }
}

class ExtraButtons extends StatefulWidget {
  final Widget screenIcon;
  const ExtraButtons({
    super.key,
    required this.screenIcon,
  });

  @override
  State<ExtraButtons> createState() => _ExtraButtonsState();
}

class _ExtraButtonsState extends State<ExtraButtons> {
  double volume = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
          width: 100,
        ),
        separateHorizontal(15),
        widget.screenIcon,
      ],
    );
  }
}

class CustomIconButton extends StatefulWidget {
  final IconData icon;
  final String tip;
  final double size;
  final bool enableHover;
  final VoidCallback? onTap;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.tip,
    required this.size,
    this.enableHover = true,
    this.onTap,
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
        child: GestureDetector(
          onTap: widget.onTap,
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
          Expanded(
            child: CustomSlider(
              value: progress,
              onChanged: (value) => setState(() => progress = value),
            ),
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
  final double shuffle;
  final double previous;
  final double playPause;
  final double playPauseRadius;
  final double next;
  final double repeat;
  final double widthSizedBox;
  const FunctionalityButtons({
    super.key,
    this.shuffle = 15,
    this.previous = 20,
    this.playPause = 28,
    this.next = 20,
    this.repeat = 15,
    this.playPauseRadius = 16,
    this.widthSizedBox = 250,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSizedBox,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIconButton(
            icon: FontAwesomeIcons.shuffle,
            tip: 'Activar reproduccion aleatoria',
            size: shuffle,
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.backwardStep,
            tip: 'Anterior',
            size: previous,
          ),
          CircleAvatar(
            backgroundColor: white,
            radius: playPauseRadius,
            child: Center(
              child: CustomIconButton(
                icon: Icons.play_arrow_rounded,
                tip: 'Reproducir',
                size: playPause,
                enableHover: false,
              ),
            ),
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.forwardStep,
            tip: 'Siguiente',
            size: next,
          ),
          CustomIconButton(
            icon: FontAwesomeIcons.repeat,
            tip: 'Activar repeticion',
            size: repeat,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: ClipRRect(
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
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: minimalPadding + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Entre Caníbales - Remasterizado 2007',
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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