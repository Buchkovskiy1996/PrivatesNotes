import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;

  const CustomTextField(
      {required this.controller,
      required this.keyboardType,
      required this.hintText,
      required this.obscureText,
      super.key});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 20,
        shadowColor: const Color(0xffE4F1F4),
        borderRadius: BorderRadius.circular(20),
        child: TextField(
          controller: controller,
          enableSuggestions: false,
          obscureText: obscureText,
          autocorrect: false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 255, 255),
            focusedBorder: border,
            enabledBorder: border,
          ),
        ),
      ),
    );
  }
}
