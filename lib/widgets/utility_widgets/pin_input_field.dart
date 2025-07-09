import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:pinput/pinput.dart';

class PinInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final int length;
  final double? height;
  final double? boxHeight;
  final double? width;
  final double? radius;
  final TextStyle? style;
  final Color? borderColor;
  final Color? fillColor;
  final Color? errorColor;
  final ValueChanged<String> onEditingComplete;
  final ValueNotifier<String?>? validationError;
  final VoidCallback? onTap;
  final VoidCallback onComplete;
  const PinInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.length,
    required this.onEditingComplete,
    required this.onComplete,
    this.height,
    this.boxHeight,
    this.width,
    this.radius,
    this.style,
    this.borderColor,
    this.fillColor,
    this.errorColor,
    this.validationError,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: width ?? 52.33.aw,
      height: boxHeight ?? 52.ah,
      textStyle: style ?? AppTextStyles.h3Inter(context),
      decoration: BoxDecoration(
        color: fillColor ?? AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(
          AppConstants.size.lowerBoarderRadius,
        ),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return ValueListenableBuilder(
      valueListenable: validationError ?? ValueNotifier<String?>(null),
      builder: (BuildContext context, String? value, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height ?? 70.ah,
              child: Pinput(
                length: length,
                controller: controller,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                onChanged: (pin) {
                  onEditingComplete(pin);
                },
                onCompleted: (pin) => onComplete.call(),
                onTap: onTap,
                preFilledWidget: Text(
                  AppStrings.dash,
                  style: AppTextStyles.h3Inter(
                    context,
                  ).copyWith(color: AppColors.slateCharcoal40),
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  width: width ?? 52.33.aw,
                  height: boxHeight ?? 52.ah,
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(
                      color: borderColor ?? AppColors.primaryOrange,
                    ),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: BoxDecoration(
                    color: errorColor ?? AppColors.failRed,
                    borderRadius: BorderRadius.circular(
                      AppConstants.size.lowerBoarderRadius,
                    ),
                  ),
                ),
              ),
            ),
            value != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.ah),
                    child: Text(
                      value,
                      style: AppTextStyles.body3RegularInter(
                        context,
                      ).copyWith(color: AppColors.failRed),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }
}
