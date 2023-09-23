import 'package:flutter/material.dart';
import 'package:spotify_desktop/widgets/recent_button.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import 'custom_list_tile.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width > 1033 ? 275 : 70,
      margin:
          const EdgeInsets.only(left: minimalPadding, bottom: minimalPadding),
      child: Column(
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeSearch(),
          separateVertical(10),
          const Library(),
        ],
      ),
    );
  }
}

class Library extends StatelessWidget {
  const Library({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> words = ['Playlist', 'Albumes', 'Artistas'];
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: minimalPadding + 10),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(minimalRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: minimalPadding + 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(minimalRadius),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.library_books_outlined,
                        color: size.width < 1033 ? white : greyText,
                      ),
                      if (size.width > 1033) ...[
                        separateHorizontal(10),
                        const Text(
                          'Tu Biblioteca',
                          style: TextStyle(
                            fontSize: 15,
                            color: greyText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.add,
                          color: greyText,
                        ),
                        separateHorizontal(20),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: greyText,
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
            separateVertical(24),
            if (size.width > 1033)
              Container(
                height: 30,
                padding: const EdgeInsets.only(left: minimalPadding + 5),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: words.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff232323),
                      ),
                      child: Text(
                        words[index],
                        style: const TextStyle(
                            color: white, fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => separateHorizontal(10),
                ),
              ),
            if (size.width > 1033) ...[
              separateVertical(12),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: minimalPadding + 10),
                child: Row(
                  children: [
                    MaterialButton(
                      hoverColor: const Color(0xff232323),
                      splashColor: tranparent,
                      highlightColor: tranparent,
                      elevation: 0,
                      shape: const CircleBorder(),
                      minWidth: 0,
                      padding: const EdgeInsets.all(12),
                      onPressed: () {},
                      child: const Icon(
                        Icons.search,
                        color: greyText,
                      ),
                    ),
                    const Spacer(),
                    const RecentButton(),
                  ],
                ),
              ),
              separateVertical(12),
            ],
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: minimalPadding),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      if (size.width > 1033)
                        Padding(
                          padding: const EdgeInsets.only(left: minimalPadding),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tus me gusta',
                                style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              // Spacer(),
                              separateVertical(5),
                              Row(
                                children: [
                                  if (index == 0) ...[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Transform.rotate(
                                        angle: .7,
                                        child: const Icon(
                                          Icons.push_pin_rounded,
                                          size: 14,
                                          color: green,
                                        ),
                                      ),
                                    ),
                                    separateHorizontal(6),
                                  ],
                                  const Text(
                                    'Playlist • 100 canciones',
                                    style: TextStyle(
                                      color: greyText,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => separateVertical(13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.circular(minimalRadius),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(minimalRadius),
            ),
            child: Column(
              children: const [
                CustomListTile(
                  icon: Icons.home_filled,
                  title: 'Inicio',
                ),
                CustomListTile(
                  icon: Icons.search,
                  title: 'Buscar',
                )
              ],
            ),
          ),
          // separateVertical(10),
        ],
      ),
    );
  }
}
