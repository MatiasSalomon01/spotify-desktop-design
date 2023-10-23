import 'package:flutter/material.dart';
import 'package:spotify_desktop/constants/values.dart';
import 'package:spotify_desktop/widgets/custom_material_button.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';
import 'middle_side.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: const [
              UpperButtons(),
              CustomTextField(),
            ],
          ),
          const TitleSection(text: 'Búsquedas recientes'),
          separateVertical(20),
          const RecentSearches(),
          // separateVertical(20),
          const TitleSection(text: 'Explorar Todo'),
          separateVertical(10),
          // separateVertical(20),
        ],
      ),
    );
  }
}

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: GridView.builder(
        itemCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size.width > 1231
              ? 5
              : size.width < 1231
                  ? size.width < 800
                      ? size.width < 800
                          ? 2
                          : 3
                      : 4
                  : 4,
          mainAxisSpacing: 10,
          childAspectRatio: .65,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            // margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: hoverGrey,
              borderRadius: BorderRadius.circular(minimalPadding),
            ),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 25, top: 15),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              "https://random.imagecdn.app/20$index/20$index",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // separateVertical(20),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Frank Sinatra',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      separateVertical(5),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          'Artista',
                          style: TextStyle(color: greyText),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: CustomMaterialButton(
                    icon: Icons.close,
                    onPressed: () {},
                    color: grey,
                    hoverColor: black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String text;
  const TitleSection({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }
}
