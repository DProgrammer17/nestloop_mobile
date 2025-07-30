import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class SelectorTabTile extends StatelessWidget {
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String> onTap;
  final EdgeInsets? indicatorPadding;
  const SelectorTabTile({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onTap,
    this.indicatorPadding,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      outerContent: SizedBox.shrink(),
      padding: EdgeInsets.fromLTRB(8.aw, 0.ah, 8.aw, 4.aw),
      borderRadius: 16.ar,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          options.length,
          (index) => InkWell(
            onTap: ()=> onTap.call(options.elementAt(index)),
            child: Container(
              padding: indicatorPadding ?? EdgeInsets.symmetric(vertical: 10.ah, horizontal: 20.aw),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selectedValue.contains(options.elementAt(index))
                    ? AppColors.baseBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12.ar),
              ),
              child: Text(
                options.elementAt(index),
                style: AppTextStyles.body1RegularInter(context).copyWith(
                  fontWeight: selectedValue.contains(options.elementAt(index))
                      ? FontWeight.w600
                      : FontWeight.w400,
                  color: selectedValue.contains(options.elementAt(index))
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal60,
                  fontSize: 13.asp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
