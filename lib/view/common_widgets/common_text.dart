import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText(
      {super.key,
      required this.title,
      this.fColor,
      this.fSize,
      this.fWeight,
      this.overflow,
      this.maxLine});

  final String title;
  final Color? fColor;
  final double? fSize;
  final FontWeight? fWeight;
  final TextOverflow? overflow;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: fColor ?? Colors.black,
          fontSize: fSize ?? 12,
          fontWeight: fWeight ?? FontWeight.normal,
          overflow: overflow ?? TextOverflow.ellipsis),
      maxLines: maxLine ?? 1,
    );
  }
}
