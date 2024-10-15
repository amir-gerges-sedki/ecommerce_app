import 'package:flutter/material.dart';
import 'package:master_store/core/device/device_utiles.dart';

class AppSizes {
  //padding and margin
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  //icon sizes
  static const double iconXs = 4.0;
  static const double iconSm = 8.0;
  static const double iconMd = 16.0;
  static const double iconLg = 24.0;
  static const double iconXl = 32.0;

  //font sizes
  static const double fontSm = 14.0;
  static const double fontMd = 16.0;
  static const double fontLg = 18.0;

  //Border Radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  //Button sizes
  static const double buttonHeight = 18.0;
  static const double buttonWidth = 120.0;
  static const double buttonRadius = 12.0;
  static const double buttonElevation = 4.0;

  //Default Spaceing between sections
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSection = 32.0;

  //Product item dimensions
  static const double productImageSize = 120.0;
  static const double productImageRadius = 16.0;
  static const double productImageHeiht = 160.0;

  //Input field
  static const double inputFieldRadius = 12.0;
  static const double spaceBtwInputFields = 16.0;

  //card Sizes
  static const double cardRadiusXs = 6.0;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusLg = 16.0;
  static const double cardElevation = 2.0;

  //AppBar Height
  static const double appBarHeight = 56.0;

  //Image Sizes
  static const double imageThumbSize = 80.0;

  //Divider height
  static const double dividerHeight = 1.0;

  //Image Carousel Height
  static const double imageCarouselHeight = 200.0;

  //Loading indeicator size
  static const double loadingSndeicatorSize = 36.0;

  //Grid veiw Spaceing
  static const double gridveiwSpaceing = 14.0;
}

class SpaceingStyle {
  static EdgeInsetsGeometry paddingwithAppBarHeight = EdgeInsets.only(
    top: DeviceUtils.getStatusBarHeight(),
    left: AppSizes.md,
    right: AppSizes.md,
    bottom: AppSizes.md,
  );
}
