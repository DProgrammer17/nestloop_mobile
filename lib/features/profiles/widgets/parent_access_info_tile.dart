import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ParentAccessInfoTile extends StatelessWidget{
  const ParentAccessInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetCasing(
      outerContent: SizedBox.shrink(),
      padding: EdgeInsets.fromLTRB(14.aw, 0, 14.aw, 8.ah),
      backgroundColor: AppColors.baseBackground,
      content: Column(
        children: [
          InfoTile(
            headerIcon: SvgPicture.asset(SvgAssets.keyIcon, height: 24.ah,),
            headerTitle: AppStrings.accessLevel,
            info: AppStrings.editAccess,
          ),
          8.sbH,
          InfoTile(
            headerIcon: Icon(
              Icons.event_available_sharp,
              size: 24.ar,
              color: AppColors.slateCharcoal80,
            ),
            headerTitle: AppStrings.accessDuration,
            info: AppStrings.permanent,
          ),
        ],
      ),
    );
  }

}