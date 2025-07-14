import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class RoleSelectorTile extends StatelessWidget {
  final Widget leadingICon;
  final String title;
  final VoidCallback onTap;
  const RoleSelectorTile({
    super.key,
    required this.leadingICon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: WidgetCasing(
        backgroundColor: AppColors.baseBackground,
        borderRadius: 16.ar,
        outerContent: SizedBox.shrink(),
        padding: EdgeInsets.fromLTRB(24.aw, 16.ah, 24.aw, 24.ah),
        content: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8.ah, horizontal: 8.ar),
              decoration: BoxDecoration(
                color: AppColors.slateCharcoal06,
                borderRadius: BorderRadius.circular(8.ar),
              ),
              child: Center(child: leadingICon),
            ),
            12.sbW,
            Text(
              title,
              style: AppTextStyles.h3Inter(
                context,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
