import 'package:flutter/material.dart';
import 'package:master_store/view/widgets/Buttonlang.dart';

class ChangeLocal extends StatelessWidget {
  const ChangeLocal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonLang(lang: 'Ar',onPressed: () {},),
            ButtonLang(lang: 'En',onPressed: () {},),
            
          ],
        ),
      ),
    );
  }
}
