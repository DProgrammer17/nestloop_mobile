import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/sign_up_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/verify_your_email.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';

class CreateYourAccount extends ConsumerWidget {
  const CreateYourAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      isLoading: ValueNotifier(ref.watch(signUpNotifier).signUpLoading),
      bottomPadding: EdgeInsets.zero,
      appBarLeadingContent: AppBackButton(),
      body: Form(
        key: ref.watch(signUpNotifier).createAccountFormKey,
        child: Column(
          children: [
            16.sbH,
            OnboardingHeaderWidget(
              header: AppStrings.createYourAccount,
              subtext: AppStrings.startManagingYourChildsCare,
            ),
            24.sbH,
            CasingAppTextfield(
              controller: ref.watch(signUpNotifier).fullNameController,
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.mood,
                  size: 20.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.fullName,
              ),
              hintText: AppStrings.fullNameHint,
              horizontalPadding: 0,
            ),
            CasingAppTextfield(
              controller: ref.watch(signUpNotifier).passwordController,
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.key_outlined,
                  size: 20.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.password,
              ),
              hintText: AppStrings.passwordHint,
              horizontalPadding: 0,
              obscureText: ref.watch(signUpNotifier).obscurePassword,
              maxLines: 1,
              suffixIcon: InkWell(
                onTap: () =>
                    ref.watch(signUpNotifier.notifier).obscurePassword(),
                child: Icon(
                  ref.watch(signUpNotifier).obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 22.ar,
                  color: AppColors.slateCharcoal60,
                ),
              ),
            ),
            CasingAppTextfield(
              controller: ref.watch(signUpNotifier).postCodeController,
              outerContent: TextFieldOuterTile(
                leading: Icon(
                  Icons.location_searching_outlined,
                  size: 20.ar,
                  color: AppColors.slateCharcoalMain,
                ),
                title: AppStrings.postcode,
              ),
              hintText: AppStrings.postcodeHint,
              horizontalPadding: 0,
            ),
            16.sbH,
          ],
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: AppButton(
              onTap: () => ref
                  .watch(signUpNotifier.notifier)
                  .validateSignUpCall(context),
              title: AppStrings.continueText,
              buttonIcon: SvgPicture.asset(
                SvgAssets.arrowCircleRightIcon,
                height: 24.ah,
                width: 24.aw,
                color: AppColors.neutralWhite,
              ),
            ),
          ),
          32.sbH,
        ],
      ),
    );
  }
}
