import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/models/data.dart';
import 'package:spotify_desktop/widgets/recent_button.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../services/general_service.dart';
import 'custom_list_tile.dart';
import 'custom_material_button.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    return Container(
      width: size.width > 1033 && service.isLibraryExpanded
          ? 600
          : service.isLibraryMin
              ? 70
              : size.width > 1033 && !service.isLibraryMin
                  ? 275
                  : 70,
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
    final service = Provider.of<GeneralService>(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
            top: minimalPadding + 10, bottom: minimalPadding),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(minimalRadius),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: service.isScrolling
                    ? [
                        const BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -10,
                          color: black,
                        ),
                      ]
                    : null,
                color: grey,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: minimalPadding + 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(minimalRadius),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                service.isLibraryMin = !service.isLibraryMin;
                                if (service.isLibraryExpanded) {
                                  service.isLibraryExpanded = false;
                                }
                              },
                              child: const Icon(
                                Icons.library_books_outlined,
                                color: greyText,
                              ),
                            ),
                            if (size.width > 1033 && !service.isLibraryMin) ...[
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
                              CustomMaterialButton(
                                icon: Icons.add,
                                onPressed: () {},
                                tip: 'Crear una playlist o una carpeta',
                              ),
                              separateHorizontal(20),
                              CustomMaterialButton(
                                icon: service.isLibraryExpanded
                                    ? Icons.arrow_back_rounded
                                    : Icons.arrow_forward_rounded,
                                onPressed: () => service.isLibraryExpanded =
                                    !service.isLibraryExpanded,
                                tip: service.isLibraryExpanded
                                    ? 'Mostrar menos'
                                    : 'Mostras mas',
                              ),
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                  separateVertical(24),
                  if (size.width > 1033 && !service.isLibraryMin)
                    Row(
                      children: [
                        Container(
                          height: 30,
                          padding:
                              const EdgeInsets.only(left: minimalPadding + 5),
                          margin: const EdgeInsets.only(bottom: 8),
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
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                separateHorizontal(10),
                          ),
                        ),
                        if (service.isLibraryExpanded) ...[
                          const Spacer(),
                          separateHorizontal(35),
                          const Expanded(
                            child: SearchInLibrary(
                              addSpaceBetween: false,
                            ),
                          )
                        ]
                      ],
                    ),
                  if (service.isLibraryExpanded)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 15,
                            right: 28,
                            top: 12,
                          ),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'Titulo',
                                style: TextStyle(color: greyText, fontSize: 12),
                              ),
                              Spacer(flex: 2),
                              Text(
                                'Fecha Agregada',
                                style: TextStyle(color: greyText, fontSize: 12),
                              ),
                              Spacer(),
                              Text(
                                'Reproducido',
                                style: TextStyle(color: greyText, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        separateVertical(10),
                        Container(
                          margin: !service.isScrolling
                              ? const EdgeInsets.only(left: 15, right: 28)
                              : EdgeInsets.zero,
                          color: white,
                          height: .1,
                        ),
                      ],
                    )
                ],
              ),
            ),
            const LibraryContent(),
          ],
        ),
      ),
    );
  }
}

class LibraryContent extends StatefulWidget {
  const LibraryContent({
    super.key,
  });

  @override
  State<LibraryContent> createState() => _LibraryContentState();
}

class _LibraryContentState extends State<LibraryContent> {
  late ScrollController _controller;

  notifyScrolling() {
    final service = Provider.of<GeneralService>(context, listen: false);
    bool value = service.isScrolling;

    if (_controller.offset == 0) {
      service.isScrolling = false;
    }

    if (!value) {
      service.isScrolling = true;
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(notifyScrolling);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);

    return Expanded(
      child: ListView(
        controller: _controller,
        children: [
          if (size.width > 1033 && !service.isLibraryMin) ...[
            if (!service.isLibraryExpanded) const SearchInLibrary(),
            separateVertical(12),
          ],
          Scrollbar(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              // padding: const EdgeInsets.symmetric(horizontal: minimalPadding),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return LibraryTile(
                  data: data[index],
                  index: index,
                );
              },
              // separatorBuilder: (context, index) => separateVertical(13),
            ),
          ),
        ],
      ),
    );
  }
}

class LibraryTile extends StatefulWidget {
  final Data data;
  final int index;
  const LibraryTile({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  State<LibraryTile> createState() => _LibraryTileState();
}

class _LibraryTileState extends State<LibraryTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final service = Provider.of<GeneralService>(context);
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: Container(
        decoration: BoxDecoration(
          color: isHover ? hoverGrey : tranparent,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(8),
        margin: size.width < 1033 || service.isLibraryMin
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 8),
        child: size.width < 1033 || service.isLibraryMin
            ? ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  widget.data.url,
                  height: 50,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: greyText.withOpacity(.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: child,
                    );
                  },
                ),
              )
            : Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.data.url,
                          height: 50,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            return Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: greyText.withOpacity(.3),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: child,
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: minimalPadding),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data.title,
                                maxLines: 1,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              // Spacer(),
                              separateVertical(5),
                              Row(
                                children: [
                                  if (widget.index == 0) ...[
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
                                  Text(
                                    widget.data.subTitle,
                                    style: const TextStyle(
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
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class SearchInLibrary extends StatelessWidget {
  final bool addSpaceBetween;
  const SearchInLibrary({
    super.key,
    this.addSpaceBetween = true,
  });

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<GeneralService>(context);
    return Padding(
      padding: const EdgeInsets.only(
          left: minimalPadding, right: minimalPadding + 5),
      child: Row(
        children: [
          CustomMaterialButton(
            icon: Icons.search,
            onPressed: () {},
            tip: 'Buscar en Tu Biblioteca',
          ),
          if (addSpaceBetween) const Spacer(),
          if (!addSpaceBetween) separateHorizontal(15),
          const RecentButton(),
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
                  route: Routes.home,
                ),
                CustomListTile(
                  icon: Icons.search,
                  title: 'Buscar',
                  route: Routes.search,
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
