import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';

class MiddleSide extends StatelessWidget {
  const MiddleSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(
          left: minimalPadding,
          right: minimalPadding,
          bottom: minimalPadding,
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [purple, grey],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, .9],
          ),
          borderRadius: BorderRadius.circular(minimalRadius),
        ),
        child: Column(
          children: [
            Container(
              height: 320,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [purple, purple.withOpacity(.2)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(minimalRadius),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: minimalPadding + 15, top: 40),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: tranparent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            spreadRadius: 20,
                            blurRadius: 40,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/flutter-music-player-9518c.appspot.com/o/images%2Fliked-songs-300.png?alt=media&token=b89872ec-3c82-4317-831e-651b84606206',
                          height: 230,
                          loadingBuilder: (context, child, loadingProgress) {
                            return Container(
                              height: 230,
                              width: 230,
                              decoration: BoxDecoration(
                                color: tranparent,
                                borderRadius:
                                    BorderRadius.circular(minimalRadius),
                              ),
                              child: child,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25, left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Playlist',
                          style: TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          'Tus me gusta',
                          style: TextStyle(
                            color: white,
                            fontSize: 75,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        separateVertical(25),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Matias Salomon',
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' • 79 canciones',
                                style: TextStyle(color: white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
