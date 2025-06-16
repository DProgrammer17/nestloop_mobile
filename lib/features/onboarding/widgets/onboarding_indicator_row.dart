import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class OnboardingIndicatorRow extends StatelessWidget {
  final int size;
  final int currentIndex;
  const OnboardingIndicatorRow({
    super.key,
    required this.size,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        size,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 600),
          margin: EdgeInsets.symmetric(horizontal: 4.aw),
          height: 8.ah,
          width: currentIndex == index ? 68.aw : 8.aw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.ar),
            color: currentIndex == index
                ? AppColors.highlightCTAOrange
                : AppColors.slateCharcoal20,
          ),
        ),
      ),
    );
  }
}
