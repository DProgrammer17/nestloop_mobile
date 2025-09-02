import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class DayContainer extends StatelessWidget{
  final Widget content;
  final Alignment? alignment;
  final double? height;
  final bool useWidth;
  const DayContainer({super.key, required this.content, this.alignment, this.height, this.useWidth = true,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 61.ah,
      width: useWidth ? 60.aw : null,
      alignment: alignment,
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        border: Border.all(color: AppColors.slateCharcoal06, width: 1.aw,),
      ),
      child: content,
    );
  }

}