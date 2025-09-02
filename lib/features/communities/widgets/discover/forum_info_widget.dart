import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_forum_model.dart';
import 'package:nest_loop_mobile/features/communities/ui/discover/discover_group_details_page.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/post_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/int_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class ForumInfoWidget extends StatelessWidget{
  final GroupInfo info;
  const ForumInfoWidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.ar),
        color: AppColors.slateCharcoal06,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(image: info.iconUrl, height: 52.ah, width: 52.aw, radius: 10.ar,),
          16.sbW,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: ()=> context.pushSuper(DiscoverGroupDetailsPage(info: info)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      info.name,
                      style: AppTextStyles.h5Inter(context).copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.slateCharcoalMain,
                      ),
                    ),
                    6.sbH,
                    SizedBox(
                      width: 270.aw,
                      child: Text(
                        info.description,
                        style: AppTextStyles.body2RegularInter(context).copyWith(
                          height: 1.4.ah,
                          color: AppColors.slateCharcoal80,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              16.sbH,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PostInfoTile(
                    icon: Icons.person,
                    iconColor: AppColors.slateCharcoal60,
                    info: AppStrings.trendingMembers(info.membersCount.toKFormat()),
                  ),
                  16.sbW,
                  PostInfoTile(
                    icon: Icons.chat_bubble,
                    iconColor: AppColors.slateCharcoal60,
                    info: AppStrings.trendingPostCount(info.newPostsCount.toKFormat()),
                  ),
                ],
              ),
              24.sbH,
              AppButton(
                onTap: (){},
                title: AppStrings.joinGroup,
                width: 270.aw,
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
        ],
      ),
    );
  }

}