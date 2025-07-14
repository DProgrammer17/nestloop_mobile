import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/child_profile/ui/child_profile_page.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class ChildProfilesPendingDialog extends StatelessWidget{
  const ChildProfilesPendingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Lottie.asset(LottieAssets.profilePendingAnimation, height: 150.ah),
        10.sbH,
        AppButton(
          onTap: ()=> context.pushSuper(ChildProfilePage()),
          title: AppStrings.addChild,),
      ],
    );
  }

}