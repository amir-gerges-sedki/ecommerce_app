import 'package:flutter/material.dart';
import 'package:master_store/core/constant/app_sizes.dart';

class Checkout extends StatelessWidget {
  const Checkout({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppSizes.sm),
      child: ElevatedButton(
          onPressed: onPressed,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Check Out'),
              SizedBox(width: AppSizes.sm),
              Icon(Icons.shopping_bag)
            ],
          )),
    );
  }
}
