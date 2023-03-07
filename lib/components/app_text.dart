import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLine;
  final FontWeight? fontWeight;

  const AppText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.textAlign,
    this.maxLine,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLine,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
