import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/sign_up_page.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/or_divider_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          12.sbH,
          Text(AppStrings.welcomeBack, style: AppTextStyles.h1Satoshi(context)),
          8.sbH,
          Text(
            AppStrings.coordinateChildCareWithEase,
            style: AppTextStyles.body4RegularInter(
              context,
            ).copyWith(color: AppColors.slateCharcoal60),
          ),
          24.sbH,
          AppButton(
            width: double.infinity,
            title: AppStrings.logInUpGoogle,
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.neutralWhite,
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
            prefixButtonIcon: SvgPicture.asset(SvgAssets.googleIcon),
          ),
          16.sbH,
          AppButton(
            width: double.infinity,
            title: AppStrings.logInUpApple,
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.neutralWhite,
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
            prefixButtonIcon: SvgPicture.asset(SvgAssets.appleIcon),
          ),
          24.sbH,
          OrDividerWidget(),
          24.sbH,
          CasingAppTextfield(
            controller: ref.watch(signUpNotifier).emailAddressController,
            outerTitle: AppStrings.signUpApple,
            hintText: AppStrings.emailAddressHint,
            horizontalPadding: 0,
          ),
          18.sbH,
          AppButton(
            title: AppStrings.logIn,
            buttonIcon: SvgPicture.asset(
              SvgAssets.arrowCircleRightIcon,
              height: 24.ah,
              width: 24.aw,
              color: AppColors.neutralWhite,
            ),
          ),
          16.sbH,
          InkWell(
            onTap: ()=> context.pushAndPopAllSuper(SignUpPage(),),
            child: RichText(
              text: TextSpan(
                text: AppStrings.dontHaveAccount,
                style: AppTextStyles.body4RegularInter(
                  context,
                ).copyWith(color: AppColors.slateCharcoal80),
                children: [
                  TextSpan(
                    text: AppStrings.signUp,
                    style: AppTextStyles.h3Inter(
                      context,
                    ).copyWith(color: AppColors.secondaryPop),
                  ),
                ],
              ),
            ),
          ),
          32.sbH,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: AppStrings.byContinuing,
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal60, height: 1.6),
              children: [
                TextSpan(
                  text: AppStrings.termsAndConditions,
                  style: AppTextStyles.body2RegularInter(
                    context,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
                TextSpan(
                  text: AppStrings.and,
                  style: AppTextStyles.body2RegularInter(
                    context,
                  ).copyWith(color: AppColors.slateCharcoal60),
                ),
                TextSpan(
                  text: AppStrings.privacyPolicy,
                  style: AppTextStyles.body2RegularInter(
                    context,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
