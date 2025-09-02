import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class DateSelectionWidget extends StatelessWidget {
  final String dateFilter;
  final VoidCallback backAction;
  final VoidCallback forwardAction;
  const DateSelectionWidget({
    super.key,
    required this.dateFilter,
    required this.backAction,
    required this.forwardAction,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      backgroundColor: AppColors.baseBackground,
      borderRadius: 18.ar,
      padding: EdgeInsets.fromLTRB(16.aw, 0.ah, 16.aw, 8.ah),
      outerContent: const SizedBox.shrink(),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            dateFilter,
            style: AppTextStyles.h3Inter(context).copyWith(fontSize: 17.asp),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8.ah,
            children: [
              InkWell(
                onTap: () => backAction.call(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.ah,
                    horizontal: 14.aw,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.ar),
                    color: AppColors.slateCharcoal06,
                  ),
                  child: Icon(
                    CupertinoIcons.chevron_left,
                    size: 15.ar,
                    color: AppColors.slateCharcoalMain,
                  ),
                ),
              ),
              InkWell(
                onTap: () => forwardAction.call(),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.ah,
                    horizontal: 14.aw,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.ar),
                    color: AppColors.slateCharcoal06,
                  ),
                  child: Icon(
                    CupertinoIcons.chevron_right,
                    size: 15.ar,
                    color: AppColors.slateCharcoalMain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
