import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/constants/values.dart';
import 'package:spotify_desktop/widgets/custom_material_button.dart';

import '../constants/colors.dart';
import '../services/general_service.dart';
import 'custom_text_field.dart';
import 'middle_side.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: const [
              UpperButtons(),
              CustomTextField(),
            ],
          ),
          separateVertical(20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              TitleSection(text: 'Búsquedas recientes'),
              ShowAllTextButton(),
            ],
          ),
          separateVertical(20),
          const SizedBox(height: 270, child: RecentSearches()),
          const TitleSection(text: 'Explorar Todo'),
          separateVertical(20),
          const ExploreAll(),
          // Wrap(
          //   children: [
          //     ...List.generate(
          //       20,
          //       (index) => Container(
          //         height: 215,
          //         width: 215,
          //         color: Color(Random().nextInt(0xffffffff)),
          //         margin: EdgeInsets.all(15),
          //       ),
          //     ),
          //   ],
          // ),
          separateVertical(20),
        ],
      ),
    );
  }
}

class ExploreAll extends StatelessWidget {
  const ExploreAll({
    super.key,
  });
  int getColumnsQuantity(BuildContext context) {
    final service = Provider.of<GeneralService>(context, listen: false);
    return service.isLibraryMin
        ? 6
        : !service.isLibraryExpanded
            ? 5
            : 3;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    final widthValue = size.width -
        (size.width > 1033 && service.isLibraryExpanded
            ? 600
            : service.isLibraryMin
                ? 70
                : size.width > 1033 && !service.isLibraryMin
                    ? 275
                    : 70);
    print(widthValue);
    return GridView.builder(
      itemCount: exploreTitles.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: getColumnsQuantity(context),
        crossAxisCount: (widthValue / 200).floor(),
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
      ),
      itemBuilder: (context, index) {
        // var number = index > 9
        //     ? index - 10
        //     : index > 99
        //         ? index - 100
        //         : index;
        return Container(
          decoration: BoxDecoration(
            color: Color(
              Random().nextInt(0xffffffff),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            child: Stack(
              children: [
                Positioned(
                  left: 15,
                  top: 10,
                  child: Wrap(children: [
                    Text(
                      exploreTitles[index],
                      style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ]),
                ),
                Positioned(
                  right: -10,
                  bottom: -10,
                  child: Transform.rotate(
                    angle: .5,
                    child: Image.network(
                      "https://random.imagecdn.app/80/80",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ShowAllTextButton extends StatefulWidget {
  const ShowAllTextButton({
    super.key,
  });

  @override
  State<ShowAllTextButton> createState() => _ShowAllTextButtonState();
}

class _ShowAllTextButtonState extends State<ShowAllTextButton> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<GeneralService>(context);

    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          service.currentMiddleRoute =
              service.currentMiddleRoute == MiddleSideRoutes.search
                  ? MiddleSideRoutes.showAll
                  : MiddleSideRoutes.search;
        },
        child: Text(
          service.currentMiddleRoute == MiddleSideRoutes.search
              ? 'Mostrar todo'
              : 'Volver',
          style: TextStyle(
            decoration:
                isHover ? TextDecoration.underline : TextDecoration.none,
            color: greyText,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decorationThickness: 2,
          ),
        ),
      ),
    );
  }
}

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    super.key,
  });

  int getColumnsQuantity(BuildContext context) {
    final service = Provider.of<GeneralService>(context, listen: false);
    return service.isLibraryMin
        ? 6
        : !service.isLibraryExpanded
            ? 5
            : 3;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);

    return GridView.builder(
      shrinkWrap: true,
      itemCount: service.currentMiddleRoute == MiddleSideRoutes.search
          ? getColumnsQuantity(context)
          : 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getColumnsQuantity(context),
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        var isEven = index % 2 == 0;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff181818),
            borderRadius: BorderRadius.circular(minimalPadding),
          ),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: !isEven
                          ? CircleAvatar(
                              radius: 75,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  "https://random.imagecdn.app/20$index/20$index",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                "https://random.imagecdn.app/20$index/20$index",
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    separateVertical(15),
                    // const Spacer(),
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
                  color: grey.withOpacity(.3),
                  hoverColor: black,
                ),
              ),
            ],
          ),
        );
      },
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
