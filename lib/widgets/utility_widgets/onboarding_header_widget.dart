import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class OnboardingHeaderWidget extends StatelessWidget {
  final String header;
  final String subtext;
  const OnboardingHeaderWidget({
    super.key,
    required this.header,
    required this.subtext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(header, style: AppTextStyles.h1Satoshi(context)),
        10.sbH,
        Text(
          subtext,
          textAlign: TextAlign.center,
          style: AppTextStyles.body4RegularInter(
            context,
          ).copyWith(color: AppColors.slateCharcoal60),
        ),
      ],
    );
  }
}
