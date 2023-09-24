import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/models/data.dart';
import 'package:spotify_desktop/widgets/recent_button.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../services/general_service.dart';
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
    final service = Provider.of<GeneralService>(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: minimalPadding + 10),
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
                            const Icon(
                              Icons.library_books_outlined,
                              color: greyText,
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
                                  color: white, fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            separateHorizontal(10),
                      ),
                    ),
                ],
              ),
            ),
            // separateVertical(12),
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

    return Expanded(
      child: ListView(
        controller: _controller,
        children: [
          if (size.width > 1033) ...[
            const SearchInLibrary(),
            separateVertical(12),
          ],
          Scrollbar(
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: minimalPadding),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            data[index].url,
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
                        if (size.width > 1033)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: minimalPadding),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index].title,
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
                                      if (index == 0) ...[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3),
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
                                        data[index].subTitle,
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
                );
              },
              separatorBuilder: (context, index) => separateVertical(13),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchInLibrary extends StatelessWidget {
  const SearchInLibrary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: minimalPadding, right: minimalPadding + 5),
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
