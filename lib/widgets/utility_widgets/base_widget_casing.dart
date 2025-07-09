import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class BaseWidgetCasing extends StatelessWidget{
  final Widget content;
  const BaseWidgetCasing({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.aw, 16.ah, 8.aw, 8.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.ar),
        color: AppColors.slateCharcoal06,
      ),
      child: content,
    );
  }

}