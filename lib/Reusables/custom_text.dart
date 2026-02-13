import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final int? maxLignes;
  final TextOverflow? textOverflow;
  final Color color;
  final FontWeight fontWeight;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 30,
    this.maxLignes,
    this.textOverflow,
    this.color = Colors.yellow,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLignes,
      overflow: textOverflow,
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: TextDecoration.none,
      ),
    );
  }
}
