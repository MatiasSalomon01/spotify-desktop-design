import 'package:flutter/material.dart';

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
      width: size.width > 1032 ? 275 : 70,
      margin: const EdgeInsets.only(left: minimalPadding),
      child: Column(
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
    return Container(
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
                      color: size.width < 1032 ? white : greyText,
                    ),
                    if (size.width > 1032) ...[
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
          separateVertical(25),
          SizedBox(
            height: 30,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: words.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 15)),
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff232323),
                      )),
                  onPressed: () {},
                  child: Text(
                    words[index],
                    style: const TextStyle(color: white),
                  ),
                );
              },
              separatorBuilder: (context, index) => separateHorizontal(10),
            ),
          ),
        ],
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
