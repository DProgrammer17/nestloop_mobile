import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class CreateGroupWidget extends StatelessWidget{
  const CreateGroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.ar),
        color: AppColors.slateCharcoalMain,
        image: DecorationImage(
          image: AssetImage(
            AppAssets.trendingPostBackgroundImage,
          ), // local asset
          fit: BoxFit.cover, // how the image should be fitted
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.createAGroup,
                style: AppTextStyles.h4Inter(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.baseBackground,
                ),
              ),
              3.sbH,
              SizedBox(
                width: 214.aw,
                child: Text(
                  AppStrings.connectWithPeople,
                  style: AppTextStyles.body2RegularInter(context).copyWith(
                    color: AppColors.baseBackground,
                  ),
                ),
              ),
            ],
          ),
          AppButton(
            onTap: () {},
            title: AppStrings.start,
            buttonColor: AppColors.neutralWhite,
            textColor: AppColors.slateCharcoalMain,
            buttonIcon: Icon(
              CupertinoIcons.plus,
              size: 22.ar,
              color: AppColors.slateCharcoalMain,
            ),
          ),
        ],
      ),
    );
  }

}