import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spotify_desktop/widgets/custom_slider.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../widgets/bottom_bar.dart';

class FullScreen extends StatefulWidget {
  final Color color;
  const FullScreen({super.key, required this.color});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: widget.color,
      // backgroundColor: Color(0xff6e3932),
      body: Stack(
        children: [
          Positioned(
            bottom: 5,
            left: 60,
            right: 60,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipRRect(
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/flutter-music-player-9518c.appspot.com/o/images%2FSodaCanci.jpg?alt=media&token=710953c8-7801-4647-8a24-ce69974b55a6&_gl=1*1vam2uq*_ga*MjA3NjE3OTM0NC4xNjc3NDIxNDM3*_ga_CW55HF8NVT*MTY5NjIwODkzOC45LjEuMTY5NjIwODk2Mi4zNi4wLjA.',
                          height: 100,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            return Container(
                              height: 100,
                              width: 102,
                              decoration: BoxDecoration(
                                color: greyText.withOpacity(.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: child,
                            );
                          },
                        ),
                      ),
                      separateHorizontal(18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Entre Caníbales - Remasterizado 2007',
                              maxLines: 2,
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            separateVertical(2),
                            const Text(
                              'Soda Stereo',
                              maxLines: 1,
                              style: TextStyle(
                                color: greyText,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  separateVertical(15),
                  Row(
                    children: [
                      const Text(
                        '0:00',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      separateHorizontal(10),
                      Expanded(
                        child: CustomSlider(
                          value: sliderValue,
                          onChanged: (value) =>
                              setState(() => sliderValue = value),
                          trackHeight: 5,
                        ),
                      ),
                      separateHorizontal(10),
                      const Text(
                        '4:12',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  separateVertical(15),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.favorite,
                              color: green,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: FunctionalityButtons(
                          playPauseRadius: 30,
                          playPause: 40,
                          shuffle: 20,
                          previous: 25,
                          next: 25,
                          repeat: 20,
                          widthSizedBox: 350,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ExtraButtons(
                              screenIcon: CustomIconButton(
                                icon:
                                    FontAwesomeIcons.downLeftAndUpRightToCenter,
                                tip: '',
                                size: 13,
                                onTap: () => Navigator.of(context).pop(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
