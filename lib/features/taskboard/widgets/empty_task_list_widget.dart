import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/taskboard/ui/new_task_page.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class EmptyTakListWidget extends StatelessWidget {
  const EmptyTakListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 95.ah),
      child: Column(
        children: [
          Container(
            height: 48.ah,
            width: 48.aw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.baseBackground,
            ),
            child: SvgPicture.asset(SvgAssets.uploadedIcon, height: 16.ah),
          ),
          24.sbH,
          Text(
            AppStrings.noTasksYet,
            style: AppTextStyles.h1Inter(context).copyWith(fontSize: 18.asp),
          ),
          8.sbH,
          Text(
            AppStrings.startByUploadingYourFirstTask,
            textAlign: TextAlign.center,
            style: AppTextStyles.body2RegularInter(
              context,
            ).copyWith(color: AppColors.slateCharcoal80),
          ),
          24.sbH,
          InkWell(
            onTap: ()=> context.pushSuper(NewTaskPage()),
            child: Container(
              height: 64.ah,
              width: 64.aw,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primaryOrange,
                border: Border.all(
                  width: 4.aw,
                  color: AppColors.baseBackground
                ),
              ),
              child: Icon(
                CupertinoIcons.plus,
                size: 22.ar,
                color: AppColors.baseBackground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
