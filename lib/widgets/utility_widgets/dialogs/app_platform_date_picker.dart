import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';

final DateTime today = DateTime.now();
final DateTime seventyYearAhead = today.add(Duration(days: 365 * 70));

Future<DateTime?> showPlatformDatePicker(BuildContext context) async {
  if (Platform.isIOS) {
    return await showCupertinoDatePicker(context);
  }
  return showMaterialDatePicker(context);
}

Future<DateTime?> showMaterialDatePicker(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialEntryMode: DatePickerEntryMode.calendar,
    firstDate: DateTime.now(),
    initialDate: DateTime.now(),
    lastDate: seventyYearAhead,
    builder: (context, child) {
      return DatePickerTheme(
        data: DatePickerThemeData(
          headerBackgroundColor: AppColors.primaryOrange,
          dayBackgroundColor: WidgetStateProperty<Color?>.fromMap(
            <WidgetStatesConstraint, Color?>{
              WidgetState.selected: AppColors.primaryOrange,
              WidgetState.hovered: AppColors.primaryOrange,
            },
          ),
          todayBackgroundColor: WidgetStateProperty<Color?>.fromMap(
            <WidgetStatesConstraint, Color?>{
              WidgetState.selected: AppColors.primaryOrange,
            },
          ),
          rangeSelectionBackgroundColor: AppColors.primaryOrange,
        ),
        child: child!,
      ); // pass child to this child
    },
  );
}

Future<DateTime?> showCupertinoDatePicker(BuildContext context) async {
  DateTime? pickedDate;
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext builder) {
      return Container(
        height: MediaQuery.of(context).copyWith().size.height / 3,
        color: Colors.white,
        child: CupertinoDatePicker(
          backgroundColor: AppColors.primaryOrange,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (picked) => pickedDate = picked,
          minimumDate: DateTime.now(),
          initialDateTime: DateTime.now(),
          maximumDate: seventyYearAhead,
        ),
      );
    },
  );

  return pickedDate;
}
