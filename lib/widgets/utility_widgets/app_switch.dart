import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';

class AppSwitch extends StatelessWidget {
  final bool selected;
  final ValueChanged<bool> onChanged;
  const AppSwitch({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: selected,
      onChanged: onChanged,
      activeTrackColor: AppColors.primaryOrange,
      inactiveTrackColor: AppColors.slateCharcoal20,
      thumbIcon: WidgetStateProperty<Icon?>.fromMap(<WidgetStatesConstraint, Icon?>{
        WidgetState.selected: Icon(
          Icons.check_circle_rounded,
          size: 16.ar,
          color: AppColors.primaryOrange,
        ),
        WidgetState.any: Icon(
          Icons.remove_circle,
          size: 16.ar,
          color: AppColors.slateCharcoal20,
        ),
      }),
    );
  }
}
