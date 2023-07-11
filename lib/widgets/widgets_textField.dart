import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        elevation: 20,
        shadowColor: Color(0xffE4F1F4),
        borderRadius: BorderRadius.circular(20),
        child: TextField(
          controller: controller,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
            focusedBorder: border,
            enabledBorder: border,
          ),
        ),
      ),
    );
  }
}
