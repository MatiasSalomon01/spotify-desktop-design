import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(left: 110, top: 10),
      child: TextFormField(
        controller: _controller,
        cursorColor: white,
        cursorWidth: .8,
        cursorHeight: 25,
        onChanged: (_) => setState(() {}),
        style: const TextStyle(color: white, fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: greyText),
          suffixIcon: _controller.text.isEmpty
              ? null
              : GestureDetector(
                  onTap: () => _controller.text = '',
                  child: const Icon(Icons.close, color: greyText),
                ),
          hintText: '¿Qué quieres escuchar?',
          hintStyle: const TextStyle(color: greyText, fontSize: 14),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: selected),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: selected),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: white),
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: selected,
        ),
      ),
    );
  }
}
