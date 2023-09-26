import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/widgets/custom_material_button.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../services/general_service.dart';

class MiddleSide extends StatelessWidget {
  const MiddleSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
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
            Stack(
              children: [
                const Header(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: minimalPadding + 15,
                    right: minimalPadding + 15,
                    top: minimalPadding + 5,
                  ),
                  child: Row(
                    children: [
                      CustomMaterialButton(
                        icon: Icons.chevron_left_rounded,
                        onPressed: () {},
                        color: black,
                        child: const Icon(
                          Icons.chevron_left_rounded,
                          color: white,
                          size: 30,
                        ),
                      ),
                      separateHorizontal(8),
                      CustomMaterialButton(
                        icon: Icons.chevron_right_rounded,
                        onPressed: () {},
                        color: const Color(0xff241a46),
                        child: const Icon(
                          Icons.chevron_right_rounded,
                          color: white,
                          size: 30,
                        ),
                      ),
                      const Spacer(),
                      CustomMaterialButton(
                        icon: Icons.notifications_outlined,
                        onPressed: () {},
                        color: const Color(0xff241a46),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: white,
                          size: 20,
                        ),
                        padding: 15,
                      ),
                      separateHorizontal(8),
                      CustomMaterialButton(
                        icon: Icons.groups_2_outlined,
                        onPressed: () {},
                        color: const Color(0xff241a46),
                        padding: 15,
                        child: const Icon(
                          Icons.groups_2_outlined,
                          color: white,
                          size: 20,
                        ),
                      ),
                      separateHorizontal(8),
                      CustomMaterialButton(
                        icon: Icons.person_2_outlined,
                        onPressed: () {},
                        color: const Color(0xff241a46),
                        child: const Icon(
                          Icons.person_2_outlined,
                          color: white,
                          size: 20,
                        ),
                        padding: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    return Container(
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
            padding: const EdgeInsets.only(left: minimalPadding + 15, top: 40),
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
                        borderRadius: BorderRadius.circular(minimalRadius),
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
                Text(
                  'Tus me gusta',
                  style: TextStyle(
                    color: white,
                    fontSize: size.width < 810
                        ? 40
                        : size.width < 1043
                            ? 70
                            : service.isLibraryExpanded
                                ? 70
                                : 75,
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
    );
  }
}
