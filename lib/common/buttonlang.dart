import 'package:flutter/material.dart';

class ButtonLang extends StatelessWidget {
  const ButtonLang({super.key, required this.lang, this.onPressed});
  final String lang;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.grey,
      onPressed: onPressed,
      child: Text(
        lang,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
