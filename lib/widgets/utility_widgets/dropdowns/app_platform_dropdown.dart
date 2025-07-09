import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dropdowns/android_dropdown.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dropdowns/cupertino_dropdown.dart';

class AppPlatformDropdown extends StatelessWidget {
  final ValueNotifier<String?> dropdownValue;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color dropIconColor;
  final Color? backGroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? dropDownTextColor;
  final String? hintText;
  final bool withHint;
  final double? height;
  final double? paddingWidth;
  final ValueNotifier<String?>? validationError;

  const AppPlatformDropdown({
    super.key,
    required this.items,
    this.onChanged,
    required this.dropdownValue,
    this.hintText,
    this.dropIconColor = AppColors.slateCharcoalMain,
    this.backGroundColor,
    this.dropDownTextColor,
    this.borderColor,
    this.height,
    this.paddingWidth,
    this.textColor,
    this.hintStyle,
    this.style,
    this.withHint = true,
    this.validationError,
  })  : assert(!withHint || (withHint && hintText != null),
  'hint text shouldn\'t be null if withHint is true');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: validationError ?? ValueNotifier<String?>(null),
      builder: (__, String? error, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: error != null
                        ? AppColors.failRed
                        : Colors.transparent,
                    width: 1),
              ),
              position: DecorationPosition.foreground,
              child: Platform.isIOS
                  ? AppCupertinoDropdown(
                items: items,
                hintText: hintText,
                withHint: withHint,
                hintStyle: hintStyle,
                style: style,
                dropdownValue: dropdownValue.value,
                onChanged: onChanged,
                dropIconColor: dropIconColor,
                backgroundColor: backGroundColor,
                borderColor: borderColor,
                textColor: textColor,
                dropDownTextColor: dropDownTextColor,
                height: height,
                paddingWidth: paddingWidth,
              )
                  : AppAndroidDropdown(
                items: items,
                hintText: hintText,
                withHint: withHint,
                hintStyle: hintStyle,
                style: style,
                dropdownValue: dropdownValue.value,
                onChanged: onChanged,
                dropIconColor: dropIconColor,
                backgroundColor: backGroundColor,
                borderColor: borderColor,
                textColor: textColor,
                dropDownTextColor: dropDownTextColor,
                height: height,
                paddingWidth: paddingWidth,
              ),
            ),
            if (error != null) const SizedBox(height: 8),
            if (error != null)
              Text(
                error,
                style: AppTextStyles.h3Inter(context).copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.failRed,
                ),
              ),
          ],
        );
      },
    );
  }
}