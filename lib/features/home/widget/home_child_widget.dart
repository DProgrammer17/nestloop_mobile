import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class HomeChildWidget extends StatelessWidget {
  final ChildData childInfo;
  final String selectedChildID;
  final ValueChanged<ChildData> onSelect;
  const HomeChildWidget({
    super.key,
    required this.childInfo,
    required this.selectedChildID,
    required this.onSelect,
  });

  bool get selected => childInfo.id == selectedChildID;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onSelect.call(childInfo),
      child: Container(
        height: 135.ah,
        padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
        decoration: BoxDecoration(
          color: selected ? AppColors.baseBackground : AppColors.slateCharcoal06,
          borderRadius: BorderRadius.circular(24.ar),
          border: Border.all(
            color: selected ? AppColors.primaryOrange : Colors.transparent,
            width: 2.aw,
          ),
        ),
        child: Column(
          children: [
            AppNetworkImage(
              image: childInfo.avatar?.url ?? '',
              height: 90.ah,
              width: 90.aw,
              radius: 18.ar,
            ),
            10.sbH,
            SizedBox(
              width: 100.aw,
              child: Text(
                childInfo.name ?? '',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body2RegularInter(context).copyWith(
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: selected
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal80,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
