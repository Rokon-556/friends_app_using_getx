import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  TextOverflow textOverflow;
  TextAlign align;
  BigText(
      {super.key,
        required this.text,
        this.color = const Color(0xFF332d2b),
        this.textSize = 0,
        this.textOverflow = TextOverflow.ellipsis,
        this.align = TextAlign.start
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: textOverflow,
      maxLines: 3,
      style: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          ),
    );
  }
}