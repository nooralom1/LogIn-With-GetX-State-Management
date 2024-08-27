import 'package:flutter/material.dart';

class ConfirmPasswordTextField extends StatelessWidget {
  const ConfirmPasswordTextField({super.key, required this.passController});
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red)),
          labelText: "Confirm Password"),
      validator: (value) {
        if (value == "" || value == null) {
          return "Confirm Password can't be empty";
        }
        return null;
      },
    );
  }
}