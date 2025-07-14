import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_notifier.dart';
import 'package:nest_loop_mobile/features/child_profile/ui/child_profile_page.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/pin_input_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class VerifyYourEmail extends ConsumerWidget {
  const VerifyYourEmail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Form(
        key: ref.watch(signUpNotifier).otpFormKey,
        child: Column(
          children: [
            16.sbH,
            OnboardingHeaderWidget(
              header: AppStrings.verifyEmail,
              subtext: AppStrings.sent6digitCodeToEmail,
            ),
            24.sbH,
            WidgetCasing(
              outerTitle: AppStrings.enterOTP,
              content: PinInputField(
                controller: ref.watch(signUpNotifier).otpController,
                focusNode: ref.watch(signUpNotifier).otpFocusNode,
                length: 6,
                onEditingComplete: (pin) {
                  if (pin.length == 6) {
                    ref.watch(signUpNotifier.notifier).validateEmailOTP(context);
                  }
                },
                onComplete: () =>
                    ref.watch(signUpNotifier.notifier).validateEmailOTP(context),
              ),
            ),
            24.sbH,
            AppButton(
              onTap: ()=> context.pushSuper(ChildProfilePage()),
              title: AppStrings.verify,
              buttonIcon: SvgPicture.asset(
                SvgAssets.arrowCircleRightIcon,
                height: 24.ah,
                width: 24.aw,
                color: AppColors.neutralWhite,
              ),
            ),
            16.sbH,
            InkWell(
              onTap: (){},
              child: RichText(
                text: TextSpan(
                  text: AppStrings.didNotReceiveCode,
                  style: AppTextStyles.body4RegularInter(
                    context,
                  ).copyWith(color: AppColors.slateCharcoal80),
                  children: [
                    TextSpan(
                      text: AppStrings.resend,
                      style: AppTextStyles.h3Inter(
                        context,
                      ).copyWith(color: AppColors.secondaryPop),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
