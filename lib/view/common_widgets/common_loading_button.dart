import 'package:flutter/material.dart';

class CommonLoadingButton extends StatelessWidget {
  const CommonLoadingButton({
    super.key,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonColor,
  });

  final double? buttonWidth;
  final double? buttonHeight;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: buttonColor ?? Colors.deepOrangeAccent,
      child: SizedBox(
        height: buttonHeight ?? 50,
        width: buttonWidth ?? MediaQuery.sizeOf(context).width,
        child: const Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: Colors.deepOrangeAccent,
          ),
        ),
      ),
    );
  }
}
