import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class OnboardingIndicator extends StatelessWidget {
  final int sections;
  final int currentSection;
  final int? midSpacing;
  const OnboardingIndicator({
    super.key,
    required this.sections,
    required this.currentSection,
    this.midSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        sections,
        (index) => Container( 
          height: 8.ah,
          width: (AppConstants.deviceWidth / sections) - (midSpacing ?? 18).aw,
          decoration: BoxDecoration(
            color: currentSection >= index
                ? AppColors.highlightCTAOrange
                : AppColors.slateCharcoal20,
            borderRadius: BorderRadius.circular(30.ar),
            border: Border.all(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
