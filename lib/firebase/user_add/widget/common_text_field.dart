import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      validator: (value) {
        if (value == "" || value == null) {
          return "Field can't be empty";
        }
        return null;
      },
    );
  }
}
