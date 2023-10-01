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
        padding: const EdgeInsets.all(minimalPadding),
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
