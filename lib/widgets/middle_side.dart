import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/widgets/custom_material_button.dart';
import 'package:spotify_desktop/widgets/sort_content.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../models/data.dart';
import '../services/general_service.dart';
import 'left_side.dart';

class MiddleSide extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  const MiddleSide({
    super.key,
    this.darkColor = const Color(0xff2a1e53),
    this.lightColor = const Color(0xff513a9d),
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: const EdgeInsets.only(
          left: minimalPadding - 2,
          right: minimalPadding - 2,
          bottom: minimalPadding * 9,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(minimalPadding),
          color: grey,
        ),
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: 550,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [darkColor, grey],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [.5, 1]),
                    borderRadius: BorderRadius.circular(minimalPadding),
                  ),
                ),
                Header(
                  lightColor: lightColor,
                  darkColor: darkColor,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 345),
                  child: FuncButtons(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 455),
                  child: Table(),
                ),
                const UpperButtons(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FuncButtons extends StatelessWidget {
  const FuncButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(minimalPadding + 15),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: green,
            radius: 28,
            child: Icon(
              Icons.play_arrow_sharp,
              color: black,
              size: 40,
            ),
          ),
          separateHorizontal(30),
          const Icon(
            Icons.download_for_offline_outlined,
            color: greyText,
            size: 35,
          ),
          const Spacer(),
          CustomMaterialButton(
            tip: 'Buscar en la playlist',
            padding: 15,
            icon: Icons.search,
            onPressed: () {},
          ),
          separateHorizontal(15),
          const SortContent()
        ],
      ),
    );
  }
}

class Table extends StatelessWidget {
  const Table({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    return Column(
      children: [
        Container(
          width: size.width,
          padding: const EdgeInsets.only(
            left: 28,
            right: 10,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Text(
                    '#',
                    style: TextStyle(
                      color: greyText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    color: tranparent,
                    child: const Text(
                      'Titulo',
                      style: TextStyle(
                        color: greyText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (size.width > 715)
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: tranparent,
                      child: const Text(
                        'Album',
                        style: TextStyle(
                          color: greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                if (size.width > 925)
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: tranparent,
                      child: const Text(
                        'Fecha en que se agrego',
                        style: TextStyle(
                          color: greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.watch_later_outlined,
                      color: greyText,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(
          color: white,
          indent: 30,
          endIndent: 30,
          thickness: .1,
        ),
        separateVertical(10),
        ...service.generateRows(size),
        separateVertical(10),
      ],
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return LibraryTile(
            data: data[index],
            index: index,
          );
        },
      ),
    );
  }
}

class UpperButtons extends StatelessWidget {
  const UpperButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            icon: Icons.person_2_outlined,
            onPressed: () {},
            color: const Color(0xff241a46),
            padding: 15,
            child: const Icon(
              Icons.person_2_outlined,
              color: white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final Color darkColor;
  final Color lightColor;
  const Header({
    super.key,
    this.darkColor = const Color(0xff2a1e53),
    this.lightColor = const Color(0xff513a9d),
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    return Container(
      height: 345,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(minimalRadius),
          topRight: Radius.circular(minimalRadius),
        ),
        gradient: LinearGradient(
          colors: [lightColor, darkColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: minimalPadding + 15, top: 70),
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
                        color: lightColor,
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
                        : size.width < 1141
                            ? 70
                            : service.isLibraryExpanded
                                ? 70
                                : 90,
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
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5,
                        ),
                      ),
                      TextSpan(
                        text: ' • 79 canciones',
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.5,
                        ),
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
