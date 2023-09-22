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
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: minimalPadding),
        child: Column(
          children: [
            const HomeSearch(),
            separateVertical(10),
            const Library(),
          ],
        ),
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
    return Container(
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
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: minimalPadding + 10,
                      vertical: minimalPadding + 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.library_books_outlined,
                        color: greyText,
                      ),
                      const Text(
                        'Tu Biblioteca',
                        style: TextStyle(
                          fontSize: 15,
                          color: greyText,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      separateHorizontal(70),
                      const Icon(
                        Icons.add,
                        color: greyText,
                      ),
                      separateHorizontal(0),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: greyText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // separateVertical(10),
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

// Expanded(
//       child: Container(
//         margin: const EdgeInsets.only(left: minimalPadding),
//         decoration: BoxDecoration(
//           color: grey,
//           borderRadius: BorderRadius.circular(minimalRadius),
//         ),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(minimalRadius),
//               ),
//               child: Column(
//                 children: const [
//                   CustomListTile(
//                     icon: Icons.home_filled,
//                     title: 'Inicio',
//                   ),
//                   CustomListTile(
//                     icon: Icons.search,
//                     title: 'Buscar',
//                   )
//                 ],
//               ),
//             ),
//             // separateVertical(10),
//           ],
//         ),
//       ),
//     );
