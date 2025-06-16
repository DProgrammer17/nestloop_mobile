import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class OnboardingImageFrame extends StatelessWidget {
  final String image;
  final String title;
  final String subtext;
  const OnboardingImageFrame({
    super.key,
    required this.image,
    required this.title,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          image,
          height: AppConstants.deviceHeight * 0.4,
          width: AppConstants.deviceWidth,
        ),
        24.sbH,
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.h1Satoshi(context),
        ),
        16.sbH,
        Text(
          subtext,
          style: AppTextStyles.body4RegularInter(
            context,
          ).copyWith(fontWeight: FontWeight.w300),
        ),
        12.sbH,
      ],
    );
  }
}
