import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/services/general_service.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../models/data.dart';

class CustomTableRow extends StatefulWidget {
  const CustomTableRow({
    super.key,
    required this.index,
    required this.size,
    required this.data,
  });

  final int index;
  final Size size;
  final Data data;

  @override
  State<CustomTableRow> createState() => _CustomTableRowState();
}

class _CustomTableRowState extends State<CustomTableRow> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final service = Provider.of<GeneralService>(context);
    return Container(
      width: widget.size.width,
      margin: const EdgeInsets.only(
        left: 28,
        right: 28,
      ),
      child: MouseRegion(
        onEnter: (event) => setState(() => isHover = true),
        onExit: (event) => setState(() => isHover = false),
        child: GestureDetector(
          onDoubleTap: () => service.currentSong = widget.data,
          child: Container(
            decoration: BoxDecoration(
              color: isHover ? rowHover : tranparent,
              borderRadius: BorderRadius.circular(6),
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              children: [
                Container(
                  // color: green,
                  alignment: Alignment.centerRight,
                  padding: widget.index + 1 < 100
                      ? widget.index + 1 > 9
                          ? const EdgeInsets.symmetric(horizontal: 16)
                          : EdgeInsets.symmetric(
                              horizontal: !isHover ? 20 : 15.5)
                      : const EdgeInsets.symmetric(horizontal: 12),
                  // padding: EdgeInsets.symmetric(horizontal: !isHover ? 20 : 15.5),
                  // constraints: BoxConstraints(maxWidth: 80),
                  child: !isHover
                      ? Text(
                          '${widget.index + 1}',
                          style: const TextStyle(
                            color: greyText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : const Icon(
                          Icons.play_arrow,
                          color: white,
                          size: 18,
                        ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: ClipRRect(
                          child: Image.network(
                            widget.data.url,
                            height: 40,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              return Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: greyText.withOpacity(.3),
                                ),
                                child: child,
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: minimalPadding + 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
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
                              separateVertical(5),
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
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.size.width > 715)
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.only(right: minimalPadding),
                      color: tranparent,
                      child: Text(
                        widget.data.subTitle,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                if (widget.size.width > 925)
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: tranparent,
                      child: Text(
                        widget.data.addedDate,
                        style: const TextStyle(
                          color: greyText,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(right: minimalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: green,
                          size: 18,
                        ),
                        Text(
                          widget.data.played,
                          style: const TextStyle(
                            color: greyText,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        if (!isHover) separateHorizontal(22),
                        if (isHover)
                          const Icon(
                            Icons.more_horiz,
                            color: white,
                            size: 22,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
