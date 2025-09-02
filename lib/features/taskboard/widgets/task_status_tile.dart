import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/task_statuses.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class TaskStatusTile extends StatelessWidget {
  final TaskStatus status;
  const TaskStatusTile({super.key, required this.status});

  Widget statusIcon() {
    switch (status) {
      case TaskStatus.pending:
      case TaskStatus.none:
        return Icon(
          Symbols.event_upcoming_sharp,
          size: 14.ar,
          color: AppColors.primaryOrange,
        );

      case TaskStatus.completed:
        return Icon(
          Symbols.event_available_sharp,
          size: 14.ar,
          color: AppColors.baseGreen,
        );

      case TaskStatus.cancelled:
      case TaskStatus.deleted:
        return Icon(
          Symbols.event_busy_sharp,
          size: 14.ar,
          color: AppColors.baseRed,
        );
    }
  }

  Color statusColor() {
    switch (status) {
      case TaskStatus.pending:
      case TaskStatus.none:
        return AppColors.primaryOrange;

      case TaskStatus.completed:
        return AppColors.baseGreen;

      case TaskStatus.cancelled:
      case TaskStatus.deleted:
        return AppColors.baseRed;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 8.aw),
      decoration: BoxDecoration(
        color: AppColors.baseBackground,
        borderRadius: BorderRadius.circular(40.ar),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          statusIcon(),
          4.sbH,
          Text(
            status.displayString,
            style: AppTextStyles.body1RegularInter(
              context,
            ).copyWith(fontWeight: FontWeight.w500, color: statusColor()),
          ),
        ],
      ),
    );
  }
}
