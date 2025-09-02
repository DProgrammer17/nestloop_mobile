import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class TimePill extends StatelessWidget{
  final String time;
  final bool showIcon;
  final Widget? icon;
  const TimePill({super.key, required this.time, this.showIcon = false, this.icon,});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.symmetric(vertical: 4.ah, horizontal: 8.aw),
      decoration: BoxDecoration(
        color: AppColors.slateCharcoal06,
        borderRadius: BorderRadius.circular(16.ar),
      ),
      child: Row(
        children: [
          if(showIcon)...[
            icon ?? Icon(
              Symbols.schedule,
              size: 16.ar,
              color: AppColors.slateCharcoal60,
            ),
            6.sbW,
          ],
          Text(
            time.to12HourFormat(),
            style: AppTextStyles.body1RegularInter(
              context,
            ).copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

}