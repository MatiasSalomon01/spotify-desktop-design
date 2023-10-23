import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_text_field.dart';
import 'middle_side.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              const UpperButtons(),
              CustomTextField(),
            ],
          ),
        ],
      ),
    );
  }
}
