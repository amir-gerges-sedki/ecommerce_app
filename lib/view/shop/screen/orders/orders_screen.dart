import 'package:flutter/material.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/view/shop/screen/orders/widgets/order_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:
            Text('My Orders', style: AppTextTheme.darkTextTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.defaultSpace),
        child: OrderItemList(),
      ),
    );
  }
}
