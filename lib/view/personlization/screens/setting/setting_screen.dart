import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_store/common/buttonlang.dart';
import 'package:master_store/common/widgets/appBar/custom_app_bar.dart';
import 'package:master_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:master_store/common/widgets/text/section_title.dart';
import 'package:master_store/core/constant/app_colors.dart';
import 'package:master_store/core/constant/app_routes.dart';
import 'package:master_store/core/constant/app_sizes.dart';
import 'package:master_store/core/localization/localecontroller.dart';
import 'package:master_store/core/theme/custom_theme/app_text_theme.dart';
import 'package:master_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:master_store/data/repositories/authentication/authentication_repo.dart';

import 'package:master_store/view/shop/screen/home/widgets/header_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocaleController localeController = Get.find<LocaleController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
                child: Column(
              children: [
                CustomAppBar(
                  title: Text(
                    'Account',
                    style: AppTextTheme.darkTextTheme.headlineMedium,
                  ),
                ),
                const UserProfileTile(),
                const SizedBox(height: AppSizes.spaceBtwSection)
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionTitle(
                    title: 'Account Setting',
                    showButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SettingMenuTile(
                      icon: Icons.location_city_outlined,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.toNamed(AppRoute.addresses)),
                  SettingMenuTile(
                      icon: Icons.shopping_bag_outlined,
                      title: 'My Cart',
                      subTitle: 'Add, remove product and move to check Out',
                      onTap: () {}),
                  SettingMenuTile(
                      icon: Icons.takeout_dining_outlined,
                      title: 'My Orders',
                      subTitle: 'in progress and completed Orders',
                      onTap: () {}),
                  SettingMenuTile(
                      icon: Icons.security_outlined,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected account',
                      onTap: () {}),
                  const SizedBox(height: AppSizes.spaceBtwSection),
                  const SectionTitle(
                    title: 'App Setting',
                    showButton: false,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SettingMenuTile(
                      icon: Icons.language_outlined,
                      title: 'Language',
                      subTitle: 'Select your language app',
                      onTap: () => Get.defaultDialog(
                            title: '',
                            content: Column(
                              children: [
                                ButtonLang(
                                  lang: 'Ar',
                                  onPressed: () {
                                    localeController.changeLang("ar");
                                    Get.back();
                                  },
                                ),
                                const SizedBox(height: 8),
                                ButtonLang(
                                  lang: 'En',
                                  onPressed: () {
                                    localeController.changeLang("en");
                                    Get.back();
                                  },
                                ),
                              ],
                            ),
                          )),
                  SettingMenuTile(
                      icon: Icons.takeout_dining_outlined,
                      title: 'My Orders',
                      subTitle: 'in progress and completed Orders',
                      onTap: () {}),
                  SettingMenuTile(
                      icon: Icons.security_outlined,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected account',
                      onTap: () {}),
                  const SizedBox(height: AppSizes.spaceBtwSection),
                  Padding(
                    padding: const EdgeInsets.all(AppSizes.defaultSpace),
                    child: InkWell(
                      onTap: () => AuthenticationRepository.instance.logout(),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log out',
                            style: TextStyle(color: AppColor.error),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSection * 3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
