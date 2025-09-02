import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_sos_member_model.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_circle_icon_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class SOSCircleMemberTile extends StatelessWidget {
  final InterimSosMemberModel member;
  const SOSCircleMemberTile({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
      outerContent: SizedBox.shrink(),
      contentSpacing: 0,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppNetworkImage(
            image: member.avatarUrl,
            height: 58.ah,
            width: 58.aw,
            radius: 16.ar,
          ),
          12.sbW,
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.aw,
                child: Text(
                  member.fullName,
                  style: AppTextStyles.h3Inter(context),
                ),
              ),
              6.sbH,
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 8.aw),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.baseBackground,
                  borderRadius: BorderRadius.circular(40.ar),
                ),
                child: SizedBox(
                  width: 100.aw,
                  child: Text(
                    member.role,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body2RegularInter(context).copyWith(
                      color: AppColors.slateCharcoal60,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
         Spacer(),
          SmallCircleIconButton(
            onTap: (){},
            icon: Icon(
              Icons.mode_edit_outlined,
              size: 19.ar,
              color: AppColors.slateCharcoal80,
            ),
          ),
          8.sbW,
          SmallCircleIconButton(
            onTap: (){},
            icon: Icon(
              Symbols.delete,
              size: 19.ar,
              color: AppColors.slateCharcoal80,
            ),
          ),
        ],
      ),
    );
  }
}
