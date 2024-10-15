import 'package:flutter/material.dart';
import 'package:master_store/core/theme/app_theme.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    required this.backGrondColor,
    required this.textColor,
  });
  final String title, image;

  final void Function()? onTap;
  final Color? backGrondColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  //color: AppColor.white.withOpacity(0.1)
                  color: backGrondColor),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 10),
              child: Center(
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(image),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(title, style: AppTheme.darkMode.textTheme.bodyLarge)
          ],
        ),
      ),
    );
  }
}
