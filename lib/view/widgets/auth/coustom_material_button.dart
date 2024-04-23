import 'package:flutter/material.dart';

class MAtrialButton extends StatelessWidget {
  const MAtrialButton(
      {super.key,
      this.onPressed,
      required this.color,
      required this.textColor,
      required this.title});
  final Function()? onPressed;
  final Color color;
  final Color textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 50,
      color: color,
      textColor: textColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    );
  }
}
