import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/helper/helper.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip(
      {super.key, required this.text, required this.selected, this.onSelected});

  final String text;
  final bool selected;
  final Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = HelperFun.getColor(text) != null;
    return SizedBox(
      height: 40,
      width: 60,
      child: ChoiceChip(
        backgroundColor: isColor ? HelperFun.getColor(text) : AppColor.dark,
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        selectedColor: AppColor.primary,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: isColor ? const CircleBorder() : null,
        labelPadding: const EdgeInsets.all(0),
      ),
    );
  }
}







    // InkWell(
    //   onTap: onSelected,
    //   child: CirclulerContainer(
    //     width: 30,
    //     height: 30,
    //     radius: 200,
    //     background: selected
    //         ? AppColor.primary
    //         : isColor
    //             ? HelperFun.getColor(text)
    //             : AppColor.darkGrey.withOpacity(0.2),
    //     padding: 0,
    //     child: Center(child: Text(text)),
    //   ),
    // );