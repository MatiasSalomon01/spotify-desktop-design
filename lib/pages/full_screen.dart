import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/widgets/custom_slider.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../models/data.dart';
import '../services/general_service.dart';
import '../widgets/bottom_bar.dart';

class FullScreen extends StatefulWidget {
  final Color color;
  final Data? data;
  const FullScreen({
    super.key,
    required this.color,
    required this.data,
  });

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    return Scaffold(
      // backgroundColor: widget.color,
      // backgroundColor: Color.fromARGB(255, 24, 20, 19),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Image.network(
              colorBlendMode: BlendMode.darken,
              widget.data!.url,
              width: size.width,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(.75),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 60,
            right: 60,
            child: SizedBox(
              width: size.width,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Hero(
                        tag: 'image',
                        child: ClipRRect(
                          child: Image.network(
                            widget.data!.url,
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
                      ),
                      separateHorizontal(18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data!.title,
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: white,
                                fontWeight: FontWeight.w600,
                                fontSize: 30,
                              ),
                            ),
                            separateVertical(2),
                            Text(
                              widget.data!.subTitle,
                              maxLines: 1,
                              style: const TextStyle(
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
