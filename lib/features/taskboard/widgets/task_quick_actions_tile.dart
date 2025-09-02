import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/features/taskboard/widgets/quick_actions_info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class TaskQuickActionsTile extends StatelessWidget {
  const TaskQuickActionsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      outerContent: TextFieldOuterTile(
        leading: Icon(
          Icons.ads_click,
          size: 22.ar,
          color: AppColors.slateCharcoalMain,
        ),
        title: AppStrings.quickActions,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          QuickActionsInfoTile(
            actionIcon: Icon(
              Icons.content_copy_rounded,
              size: 22.ar,
              color: AppColors.slateCharcoalMain,
            ),
            title: AppStrings.duplicate,
            onTap: () {},
          ),
          QuickActionsInfoTile(
            actionIcon: Icon(
              Icons.date_range,
              size: 22.ar,
              color: AppColors.baseGreen,
            ),
            title: AppStrings.reschedule,
            onTap: () {},
          ),
          QuickActionsInfoTile(
            actionIcon: Icon(
              Symbols.input_circle,
              size: 22.ar,
              color: AppColors.primaryOrange,
            ),
            title: AppStrings.share,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
