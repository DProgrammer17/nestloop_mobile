import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/child_profile/state/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/profile_image_widget.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/utils/textfield_formatter/date_formatter.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dropdowns/app_platform_dropdown.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ChildProfileFirstStep extends ConsumerWidget {
  const ChildProfileFirstStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.sbH,
          OnboardingHeaderWidget(
            header: AppStrings.tellUsAboutYourChild,
            subtext: AppStrings.addTheBasics,
          ),
          32.sbH,
          ProfileImageWidget(
            profileImage: (image) => ref
                .watch(childProfileNotifier.notifier)
                .updateProfileImage(image),
          ),
          24.sbH,
          CasingAppTextfield(
            isRequired: true,
            controller: ref.watch(childProfileNotifier).nameController,
            outerContent: TextFieldOuterTile(
              leading: SvgPicture.asset(SvgAssets.childCareIcon, height: 20.ah),
              title: AppStrings.childName,
            ),
            hintText: AppStrings.childNameHint,
            horizontalPadding: 0,
          ),
          CasingAppTextfield(
            isRequired: true,
            controller: ref.watch(childProfileNotifier).ageController,
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Icons.bedroom_baby_outlined,
                size: 21.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.childAge,
            ),
            hintText: AppStrings.childAgeHint,
            horizontalPadding: 0,
          ),
          CasingAppTextfield(
            isRequired: true,
            controller: ref.watch(childProfileNotifier).dobController,
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Icons.calendar_today_outlined,
                size: 21.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.dob,
            ),
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
              LengthLimitingTextInputFormatter(10),
              DateInputFormatterYYYYMMdd(),
            ],
            hintText: AppStrings.dobHint,
            horizontalPadding: 0,
          ),
          8.sbH,
          WidgetCasing(
            outerContent: TextFieldOuterTile(
              isRequired: true,
              leading: Icon(
                Icons.female_outlined,
                size: 26.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.gender,
            ),
            content: AppPlatformDropdown(
              withHint: false,
              onChanged: (gender) =>
                  ref.watch(childProfileNotifier.notifier).updateGender(gender),
              items: [AppStrings.male, AppStrings.female],
              dropdownValue: ValueNotifier(
                ref.watch(childProfileNotifier).gender,
              ),
            ),
          ),
          16.sbH,
          WidgetCasing(
            outerContent: TextFieldOuterTile(
              leading: SvgPicture.asset(SvgAssets.diagnosisIcon, height: 20.ah),
              title: AppStrings.diagnosisIf,
            ),
            content: AppPlatformDropdown(
              withHint: false,
              onChanged: (diagnosis) => ref
                  .watch(childProfileNotifier.notifier)
                  .updateDiagnosis(diagnosis),
              items: ['', 'o'],
              dropdownValue: ValueNotifier(
                ref.watch(childProfileNotifier).diagnosis,
              ),
            ),
          ),
          if (ref.watch(childProfileNotifier).showAllergies) ...[
            8.sbH,
            CasingAppTextfield(
              controller: ref.watch(childProfileNotifier).allergiesController,
              outerContent: TextFieldOuterTile(
                leading: SvgPicture.asset(
                  SvgAssets.allergiesIcon,
                  height: 22.ah,
                ),
                title: AppStrings.allergies,
                suffixIcon: InkWell(
                  onTap: () => ref
                      .watch(childProfileNotifier.notifier)
                      .updateShowAllergies(false),
                  child: Icon(
                    Icons.close_sharp,
                    size: 18.ar,
                    color: AppColors.slateCharcoalMain,
                  ),
                ),
              ),
              hintText: AppStrings.allergiesHint,
              horizontalPadding: 0,
            ),
          ],
          if (ref.watch(childProfileNotifier).showTriggers) ...[
            8.sbH,
            CasingAppTextfield(
              controller: ref.watch(childProfileNotifier).triggersController,
              outerContent: TextFieldOuterTile(
                leading: SvgPicture.asset(
                  SvgAssets.triggersIcon,
                  height: 17.ah,
                ),
                title: AppStrings.triggers,
                suffixIcon: InkWell(
                  onTap: () => ref
                      .watch(childProfileNotifier.notifier)
                      .updateShowTriggers(false),
                  child: Icon(
                    Icons.close_sharp,
                    size: 18.ar,
                    color: AppColors.slateCharcoalMain,
                  ),
                ),
              ),
              hintText: AppStrings.triggersHint,
              horizontalPadding: 0,
            ),
          ],
          16.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!ref.watch(childProfileNotifier).showAllergies) ...[
                SmallInfoButton(
                  onTap: () => ref
                      .watch(childProfileNotifier.notifier)
                      .updateShowAllergies(true),
                  leading: Icon(
                    Icons.add,
                    size: 18.ar,
                    color: AppColors.baseBlack,
                  ),
                  title: AppStrings.addAllergies,
                ),
              ],
              if (!ref.watch(childProfileNotifier).showTriggers) ...[
                8.sbW,
                SmallInfoButton(
                  onTap: () => ref
                      .watch(childProfileNotifier.notifier)
                      .updateShowTriggers(true),
                  leading: Icon(
                    Icons.add,
                    size: 18.ar,
                    color: AppColors.baseBlack,
                  ),
                  title: AppStrings.addTriggers,
                ),
              ],
            ],
          ),
          32.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          AppButton(
            onTap: () => ref.watch(childProfileNotifier.notifier).validateChildProfileFirstPage(context),
            title: AppStrings.next,
            buttonIcon: SvgPicture.asset(
              SvgAssets.arrowCircleRightIcon,
              height: 24.ah,
              width: 24.aw,
              color: AppColors.neutralWhite,
            ),
          ),
          40.sbH,
        ],
      ),
    );
  }
}
