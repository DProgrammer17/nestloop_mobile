import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class NoDataPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showButton;
  final String? buttonTitle;
  final VoidCallback? buttonAction;
  const NoDataPage({
    super.key,
    required this.title,
    this.subtitle,
    this.showButton = false,
    this.buttonTitle,
    this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.baseBackground,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(LottieAssets.noDataFoundAnimation, height: 200.ah),
            32.sbH,
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h1Satoshi(
                context,
              ).copyWith(fontSize: 22.asp),
            ),
            if (subtitle.isNotBlank) ...[
              10.sbH,
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: AppTextStyles.body2RegularInter(
                  context,
                ).copyWith(color: AppColors.slateCharcoal60),
              ),
            ],
            if (showButton) ...[
              16.sbH,
              Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
              8.sbH,
              AppButton(onTap: buttonAction, title: buttonTitle!),
            ],
            80.sbH,
          ],
        ),
      ),
    );
  }
}
