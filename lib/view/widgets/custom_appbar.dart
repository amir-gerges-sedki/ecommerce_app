import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final IconData icon;
  final bool active;
  const CustomAppBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed, required this.active, });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color: active==true?Colors.blue:Colors.black,),
          Text(text,style: TextStyle(color: active==true?Colors.blue:Colors.black),),
        ],
      ),
    );
  }
}
