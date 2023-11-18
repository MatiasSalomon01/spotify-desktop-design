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
    // final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
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
          const SizedBox(height: 300, child: RecentSearches()),
          const TitleSection(text: 'Explorar Todo'),
          separateVertical(20),
          const ExploreAll(),
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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: exploreTitles.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (widthValue / 250).floor(),
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
      ),
      itemBuilder: (context, index) {
        var color = Random().nextInt(0xffffffff);
        return Container(
          decoration: BoxDecoration(
            color: Color(color),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      exploreTitles[index],
                      style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -10,
                bottom: -10,
                child: Transform.rotate(
                  angle: .5,
                  child: Image.network(
                    "https://random.imagecdn.app/80/80",
                    loadingBuilder: (_, child, __) {
                      return Container(
                        height: 80,
                        width: 80,
                        color: Color(color).withOpacity(.3),
                        child: child,
                      );
                    },
                  ),
                ),
              ),
            ],
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
    final widthValue = size.width -
        (size.width > 1033 && service.isLibraryExpanded
            ? 600
            : service.isLibraryMin
                ? 70
                : size.width > 1033 && !service.isLibraryMin
                    ? 275
                    : 70);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: service.currentMiddleRoute == MiddleSideRoutes.search
          ? getColumnsQuantity(context)
          : 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getColumnsQuantity(context),
        // crossAxisCount: (widthValue / 200).floor(),
        mainAxisSpacing: 25,
        crossAxisSpacing: 25,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        var isEven = index % 2 == 0;
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xff181818),
            // color: Colors.red,
            borderRadius: BorderRadius.circular(minimalPadding),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 15, left: 15),
                    child: Center(
                      child: !isEven
                          ? CircleAvatar(
                              radius: 190 / 2,
                              backgroundColor: selected,
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
                                height: 190,
                                fit: BoxFit.cover,
                                loadingBuilder: (_, child, __) {
                                  return Container(
                                    height: 190,
                                    width: double.infinity,
                                    color: selected,
                                    child: child,
                                  );
                                },
                              ),
                            ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Titulo #${index + 1}',
                      style: const TextStyle(
                          color: white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  separateVertical(5),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Subtitulo',
                      style: TextStyle(color: greyText),
                    ),
                  ),
                  const Spacer(),
                ],
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
