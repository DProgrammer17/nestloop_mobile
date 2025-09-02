import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/post_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class TrendingPostWidget extends StatelessWidget {
  const TrendingPostWidget({super.key});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 8.aw),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.ar),
              color: AppColors.slateCharcoal80,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Symbols.kid_star_rounded,
                  size: 14.ar,
                  color: AppColors.baseBackground,
                ),
                4.sbW,
                Text(
                  AppStrings.trending,
                  style: AppTextStyles.body1RegularInter(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.baseBackground,
                  ),
                ),
              ],
            ),
          ),
          16.sbH,
          Text(
            AppStrings.mentalHealthSupport,
            style: AppTextStyles.h4Inter(context).copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.baseBackground,
            ),
          ),
          6.sbH,
          Text(
            AppStrings.mentalHealthSupportInfo,
            style: AppTextStyles.body2RegularInter(context).copyWith(
              height: 1.4.ah,
              color: AppColors.baseBackground,
            ),
          ),
          16.sbH,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PostInfoTile(
                icon: Symbols.person,
                info: AppStrings.trendingMembers('2.3k'),
              ),
              16.sbW,
              PostInfoTile(
                icon: Symbols.chat_bubble,
                info: AppStrings.trendingPostCount(28.toString()),
              ),
            ],
          ),
          24.sbH,
          AppButton(
            onTap: (){},
            title: AppStrings.joinGroup,
            width: double.infinity,
            buttonIcon: Icon(
              Symbols.add,
              size: 22.ar,
              color: AppColors.baseBlack,
            ),
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.baseBackground,
          ),
        ],
      ),
    );
  }
}
