import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

abstract class AppPlatformBottomSheet {
  static void showAppBottomModalSheet({
    required BuildContext context,
    required Widget content,
    bool showCloseButton = true,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
  }) {
    if (Platform.isAndroid) {
      showMaterialModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        backgroundColor: backgroundColor ?? AppColors.overlayGrey.withOpacity(0.5),
        builder: (ctx) => SingleChildScrollView(
          controller: ModalScrollController.of(ctx),
          child: Column(
            children: [
              if (showCloseButton) ...[
                12.sbH,
                InkWell(
                  onTap: ()=> context.popSuper(),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 56.ah,
                      width: 56.aw,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.baseBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        CupertinoIcons.xmark,
                        size: 18.ar,
                        color: AppColors.slateCharcoalMain,
                      ),
                    ),
                  ),
                ),
                8.sbH,
              ],
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16.ah,
                  horizontal: 12.aw,
                ),
                decoration: BoxDecoration(
                  color: AppColors.baseBackground,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32.ar),
                  ),
                ),
                child: content,
              ),
            ],
          ),
        ),
      );
      return;
    }

    showCupertinoModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? AppColors.overlayGrey.withOpacity(0.5),
      builder: (ctx) => Column(
        children: [
          if (showCloseButton) ...[
            12.sbH,
            InkWell(
              onTap: ()=> context.popSuper(),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 56.ah,
                  width: 56.aw,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.baseBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.xmark,
                    size: 18.ar,
                    color: AppColors.slateCharcoalMain,
                  ),
                ),
              ),
            ),
            8.sbH,
          ],
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.ah,
              horizontal: 16.aw,
            ),
            constraints: BoxConstraints(
              maxHeight: AppConstants.deviceHeight * 0.8
            ),
            decoration: BoxDecoration(
              color: AppColors.baseBackground,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32.ar),
              ),
            ),
            child: content,
          ),
        ],
      ),
    );
  }
}
