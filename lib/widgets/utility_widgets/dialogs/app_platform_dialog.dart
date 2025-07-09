import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<bool?> showPlatformActionDialog({
  required BuildContext context,
  List<WidgetBuilder>? actions,
  Widget? title,
  Widget? content,
  Color? backgroundColor,
  barrierDismissible = true,
  WidgetBuilder? builder,
  MainAxisAlignment? actionAlignment = MainAxisAlignment.end,
}) async {
  if (Platform.isIOS) {
    return showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Material(
          type: MaterialType.transparency,
          color: Colors.transparent,
          child: CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions?.map((e) => e.call(context)).toList() ?? [],
          ),
        );
      },
    );
  } else {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (content != null) content,
              Column(
                mainAxisAlignment: actionAlignment!,
                children: actions?.map((e) => e.call(context)).toList() ?? [],
              ),
            ],
          ),
        );
      },
    );
  }
}