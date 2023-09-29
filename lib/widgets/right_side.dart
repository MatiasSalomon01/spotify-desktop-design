import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_desktop/widgets/custom_material_button.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import '../services/general_service.dart';

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<GeneralService>(context);
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(right: minimalPadding),
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(minimalRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMaterialButton(
                icon: Icons.close,
                onPressed: () => service.hideRightSide = true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
