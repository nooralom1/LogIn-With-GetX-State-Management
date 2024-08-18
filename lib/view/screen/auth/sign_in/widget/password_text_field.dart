import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, required this.passController});
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red)),
          labelText: "Password"),
      validator: (value) {
        if (value == "" || value == null) {
          return "Password can't be empty";
        }
        return null;
      },
    );
  }
}
