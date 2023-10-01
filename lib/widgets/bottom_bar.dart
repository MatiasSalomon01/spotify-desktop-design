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

class ExtraButtons extends StatelessWidget {
  const ExtraButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const Spacer(),
          const Icon(
            Icons.mic,
            color: greyText,
            size: 18,
          ),
          separateHorizontal(15),
          const Icon(
            Icons.queue_music_rounded,
            color: greyText,
            size: 22,
          ),
          separateHorizontal(15),
          const Icon(
            FontAwesomeIcons.computer,
            color: greyText,
            size: 15,
          ),
          separateHorizontal(15),
          const Icon(
            FontAwesomeIcons.volumeLow,
            color: greyText,
            size: 15,
          ),
          separateHorizontal(5),
          CustomSlider(),
          separateHorizontal(15),
          const Icon(
            FontAwesomeIcons.upRightAndDownLeftFromCenter,
            color: greyText,
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
          const CustomSlider(),
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
          FaIcon(
            FontAwesomeIcons.shuffle,
            color: greyText,
            size: 15,
          ),
          FaIcon(
            FontAwesomeIcons.backwardStep,
            color: greyText,
            size: 20,
          ),
          CircleAvatar(
            backgroundColor: white,
            radius: 16,
            child: Center(
              child: Icon(
                Icons.play_arrow_rounded,
                color: black,
                size: 28,
              ),
            ),
          ),
          FaIcon(
            FontAwesomeIcons.forwardStep,
            color: greyText,
            size: 20,
          ),
          FaIcon(
            FontAwesomeIcons.repeat,
            color: greyText,
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
        padding: const EdgeInsets.only(left: 4),
        child: Row(
          children: [
            ClipRRect(
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/flutter-music-player-9518c.appspot.com/o/images%2Fliked-songs-300.png?alt=media&token=b89872ec-3c82-4317-831e-651b84606206',
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
                    width: 170,
                    child: Text(
                      'Just the Two of Us',
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
                    'Grover Washington, Jr., Bill Withers',
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
