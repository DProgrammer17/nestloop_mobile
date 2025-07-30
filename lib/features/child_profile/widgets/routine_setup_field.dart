import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/utils/textfield_formatter/time_hhmm_formatter.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_text_field.dart';

class RoutineSetupField extends StatefulWidget {
  final ValueChanged<String> onTimeChanged;
  final ValueChanged<String> onRoutineChanged;
  final VoidCallback removeAction;
  const RoutineSetupField({
    super.key,
    required this.onTimeChanged,
    required this.onRoutineChanged,
    required this.removeAction,
  });

  @override
  State<RoutineSetupField> createState() => _RoutineSetupFieldState();
}

class _RoutineSetupFieldState extends State<RoutineSetupField> {
  TextEditingController timeController = TextEditingController();
  TextEditingController routineController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    timeController.dispose();
    routineController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: AppTextField(
            controller: timeController,
            horizontalPadding: 0,
            hintText: AppStrings.timeHint,
            onChanged: (value) => widget.onTimeChanged.call(value),
            contentPadding: EdgeInsets.fromLTRB(20.aw, 5.ah, 5.aw, 5.ah),
            hintStyle: AppTextStyles.body1RegularInter(context).copyWith(
              fontSize: 13.asp,
             color: AppColors.slateCharcoal40,
            ),
            style: AppTextStyles.body1RegularInter(context).copyWith(
              fontSize: 13.asp,
            ),
            inputFormatter: [TimeInputFormatter()],
          ),
        ),
        10.sbW,
        Flexible(
          flex: 2,
          child: AppTextField(
            controller: routineController,
            horizontalPadding: 0,
            hintText: AppStrings.routineDetailHint,
            onChanged: (value) => widget.onRoutineChanged.call(value),
            contentPadding: EdgeInsets.fromLTRB(10.aw, 5.ah, 5.aw, 5.ah),
            hintStyle: AppTextStyles.body1RegularInter(context).copyWith(
              fontSize: 13.asp,
              color: AppColors.slateCharcoal40,
            ),
            style: AppTextStyles.body1RegularInter(context).copyWith(
              fontSize: 13.asp,
            ),
            inputFormatter: [LengthLimitingTextInputFormatter(500)],
          ),
        ),
        10.sbW,
        InkWell(
          onTap: (){
            timeController.clear();
            routineController.clear();
            widget.removeAction.call();
          },
          child: Icon(
            CupertinoIcons.xmark,
            size: 19.ar,
            color: AppColors.slateCharcoal80,
          ),
        ),
      ],
    );
  }
}
