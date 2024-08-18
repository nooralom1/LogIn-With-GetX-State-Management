import 'package:flutter/material.dart';

import 'common_text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      required this.buttonName,
      this.buttonWidth,
      this.buttonHeight,
      this.buttonColor,
      this.textColor,
      required this.onTap});

  final String buttonName;
  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;
  final Color? textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: buttonColor ?? Colors.deepOrangeAccent,
        child: SizedBox(
          height: buttonHeight ?? 50,
          width: buttonWidth ?? MediaQuery.sizeOf(context).width,
          child: Center(
            child: CommonText(
              title: buttonName,
              fColor: textColor ?? Colors.white,
              fSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
