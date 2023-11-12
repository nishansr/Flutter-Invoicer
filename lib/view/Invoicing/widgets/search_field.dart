import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType type;

  const SearchField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.type = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(width: 1.0, color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(width: 1.0, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(width: 1.0, color: Colors.white),
          ),
          hintText: hintText,
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
