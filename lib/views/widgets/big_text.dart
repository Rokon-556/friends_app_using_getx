import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double textSize;
  TextOverflow textOverflow;
  TextAlign align;
  double lineHeight ;
  BigText(
      {super.key,
        required this.text,
        this.color = const Color(0xFF332d2b),
        this.textSize = 0,
        this.textOverflow = TextOverflow.ellipsis,
        this.align = TextAlign.start,
        this.lineHeight = 1.2
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
          fontSize: textSize,
          fontWeight: FontWeight.w500,
          height: lineHeight
          ),
    );
  }
}