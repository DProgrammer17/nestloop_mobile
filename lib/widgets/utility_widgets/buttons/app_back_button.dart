import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';

class AppBackButton extends StatelessWidget {
  final double? size;
  final VoidCallback? onTap;
  const AppBackButton({super.key, this.size, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () => context.popSuper(),
      child: Icon(
        CupertinoIcons.arrow_left,
        size: size ?? 35.ar,
        color: AppColors.highlightCTAOrange,
      ),
    );
  }
}
