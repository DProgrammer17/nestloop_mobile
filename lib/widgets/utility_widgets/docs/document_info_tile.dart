import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';

class DocInfoTile extends StatelessWidget{
  final String fileName;
  final VoidCallback removeAction;
  const DocInfoTile({super.key, required this.fileName, required this.removeAction,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgAssets.uploadedDocsIcon,
          height: 40.ah,
        ),
        10.33.sbH,
        RichText(
          text: TextSpan(
            text: fileName,
            style: AppTextStyles.body4RegularInter(context)
                .copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.secondaryPop,
            ),
            children: [
              TextSpan(
                text: AppStrings.uploaded,
                style: AppTextStyles.body2RegularInter(
                  context,
                ).copyWith(color: AppColors.slateCharcoal40),
              ),
            ],
          ),
        ),
        24.sbH,
        SizedBox(
          width: 106.aw,
          child: SmallInfoButton(
            leading: Icon(
              CupertinoIcons.trash,
              size: 14.ar,
              color: AppColors.slateCharcoalMain,
            ),
            title: AppStrings.remove,
            onTap: removeAction,
          ),
        ),
      ],
    );
  }

}