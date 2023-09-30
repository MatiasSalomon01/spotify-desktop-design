import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../models/data.dart';

class CustomTableRow extends StatelessWidget {
  const CustomTableRow({
    super.key,
    required this.index,
    required this.size,
  });

  final int index;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.only(
        left: minimalPadding * 4,
        right: minimalPadding * 8,
        bottom: 10,
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: 40,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: greyText,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              // color: green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: ClipRRect(
                      child: Image.network(
                        data2[index].url,
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
                            data2[index].title,
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
                            data2[index].subTitle,
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
          ),
          if (size.width > 715)
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(right: minimalPadding),
                color: tranparent,
                child: Text(
                  data2[index].subTitle,
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
          if (size.width > 925)
            Expanded(
              flex: 4,
              child: Container(
                color: tranparent,
                child: Text(
                  data2[index].addedDate,
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
              alignment: Alignment.centerRight,
              // color: green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: green,
                    size: 18,
                  ),
                  Text(
                    data2[index].played,
                    style: const TextStyle(
                      color: greyText,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
