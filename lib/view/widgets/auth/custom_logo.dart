import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo.png',
          width: 60,
          height: 60,
          color:const Color.fromARGB(255, 4, 122, 107)
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
