import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/layout_helper.dart';

abstract class AppTextStyles {
  static TextStyle h1Satoshi(BuildContext context) => TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.slateCharcoalMain,
    fontSize: context.isMobile ? 24.asp : 10.asp,
  );

  static TextStyle h2Satoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.slateCharcoalMain,
    fontSize: 14.asp,
  );

  static TextStyle h3Satoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.slateCharcoalMain,
    fontSize: 16.asp,
  );

  static TextStyle h4Satoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.slateCharcoalMain,
    fontSize: 20.asp,
  );

  static TextStyle h5Satoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.slateCharcoalMain,
    fontSize: 18.asp,
  );

  static TextStyle body1RegularSatoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize: context.isMobile ? 12.asp : 8.asp,
  );

  static TextStyle body2RegularSatoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize:context.isMobile ? 14.asp : 8.asp,
  );

  static TextStyle body3RegularSatoshi (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.satoshiFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize: 10.asp,
  );

  static TextStyle h1Inter(BuildContext context) => TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w700,
    color: AppColors.slateCharcoalMain,
    fontSize: context.isMobile ? 28.asp : 14.asp,
  );

  static TextStyle h2Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.slateCharcoalMain,
    fontSize: 14.asp,
  );

  static TextStyle h3Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.slateCharcoalMain,
    fontSize: 16.asp,
  );

  static TextStyle h4Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.slateCharcoalMain,
    fontSize: 20.asp,
  );

  static TextStyle h5Inter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w600,
    color: AppColors.slateCharcoalMain,
    fontSize: 18.asp,
  );

  static TextStyle body1RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize: context.isMobile ? 12.asp : 8.asp,
  );

  static TextStyle body2RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize:context.isMobile ? 14.asp : 8.asp,
  );

  static TextStyle body3RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize: 10.asp,
  );

  static TextStyle body4RegularInter (BuildContext context) =>  TextStyle(
    fontFamily: AppStrings.interFontFamily,
    fontWeight: FontWeight.w400,
    color: AppColors.slateCharcoalMain,
    fontSize:context.isMobile ? 16.asp : 10.asp,
  );
}