import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/child_profile/child_profile_summary.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/upload_docs_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ChildProfileSecondPage extends ConsumerWidget {
  const ChildProfileSecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppBackButton(
              onTap: () {
                ref
                    .watch(childProfileNotifier)
                    .profilePageController
                    .previousPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                ref.watch(childProfileNotifier.notifier).updatePage(0);
              },
            ),
          ),
          16.sbH,
          OnboardingHeaderWidget(
            header: AppStrings.addMoreDetails,
            subtext: AppStrings.uploadDocsAndTags,
          ),
          32.sbH,
          CasingAppTextfield(
            controller: ref.watch(childProfileNotifier).therapyGoalsController,
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Icons.sports_soccer_outlined,
                size: 23.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.therapyGoalsIf,
            ),
            hintText: AppStrings.therapyGoalsIfHint,
            horizontalPadding: 0,
          ),
          CasingAppTextfield(
            controller: ref.watch(childProfileNotifier).dailyRoutineController,
            outerContent: TextFieldOuterTile(
              leading: SvgPicture.asset(SvgAssets.routineIcon, height: 24.ah),
              title: AppStrings.dailyRoutineIf,
            ),
            hintText: AppStrings.dailyRoutineIfHint,
            horizontalPadding: 0,
          ),
          8.sbH,
          UploadDocsTile(),
          16.sbH,
          WidgetCasing(
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Icons.label_outline_sharp,
                size: 23.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.addTagsIf,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: ref.watch(childProfileNotifier).tags.isEmpty
                        ? 16.5.ah
                        : 8.5.ah,
                    horizontal: ref.watch(childProfileNotifier).tags.isEmpty
                        ? 16.ah
                        : 8.ah,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.neutralWhite,
                    borderRadius: BorderRadius.circular(16.ar),
                  ),
                  child: ref.watch(childProfileNotifier).tags.isEmpty
                      ? Text(
                          AppStrings.addTagsIfHint,
                          style: AppTextStyles.body2RegularInter(context)
                              .copyWith(
                                fontSize: 16.asp,
                                color: AppColors.slateCharcoal40,
                              ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              ref.watch(childProfileNotifier).tags.length,
                              (index) => Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 0 : 4.aw,
                                  right:
                                      index ==
                                          (ref
                                                  .watch(childProfileNotifier)
                                                  .tags
                                                  .length -
                                              1)
                                      ? 0
                                      : 4.aw,
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.ah,
                                  horizontal: 16.aw,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.neutralWhite,
                                  borderRadius: BorderRadius.circular(12.ar),
                                  border: Border.all(
                                    color: AppColors.slateCharcoal06,
                                    width: 1.aw,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      ref
                                          .watch(childProfileNotifier)
                                          .tags
                                          .elementAt(index),
                                      style:
                                          AppTextStyles.body2RegularInter(
                                            context,
                                          ).copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.slateCharcoal80,
                                          ),
                                    ),
                                    4.sbW,
                                    InkWell(
                                      onTap: () => ref
                                          .watch(childProfileNotifier.notifier)
                                          .removeFromTags(
                                            ref
                                                .watch(childProfileNotifier)
                                                .tags
                                                .elementAt(index),
                                          ),
                                      child: Icon(
                                        CupertinoIcons.clear,
                                        size: 18.ar,
                                        color: AppColors.slateCharcoalMain,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                16.sbH,
                Padding(
                  padding: EdgeInsets.only(left: 8.aw),
                  child: Text(
                    AppStrings.chooseSuggestionBelow,
                    style: AppTextStyles.body2RegularInter(
                      context,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                16.sbH,
                Wrap(
                  children: List.generate(
                    ref.watch(childProfileNotifier).tagSuggestions.length,
                    (index) => InkWell(
                      onTap: () => ref
                          .watch(childProfileNotifier.notifier)
                          .addToTags(
                            ref
                                .watch(childProfileNotifier)
                                .tagSuggestions
                                .elementAt(index),
                          ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4.ah,
                          horizontal: 8.aw,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.ah,
                          horizontal: 16.aw,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.neutralWhite,
                          borderRadius: BorderRadius.circular(12.ar),
                          border: Border.all(
                            color:
                                ref
                                    .watch(childProfileNotifier)
                                    .tags
                                    .any(
                                      (e) => e.contains(
                                        ref
                                            .watch(childProfileNotifier)
                                            .tagSuggestions
                                            .elementAt(index),
                                      ),
                                    )
                                ? AppColors.primaryOrange
                                : Colors.transparent,
                          ),
                        ),
                        child: Text(
                          ref
                              .watch(childProfileNotifier)
                              .tagSuggestions
                              .elementAt(index),
                          style: AppTextStyles.body2RegularInter(context)
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.slateCharcoal80,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          32.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          AppButton(
            onTap: () async {
              await ref
                  .watch(childProfileNotifier.notifier)
                  .addToProfile(
                    ChildProfileModel(
                      image: ref.watch(childProfileNotifier).profileImage!,
                      name: ref.watch(childProfileNotifier).nameController.text,
                      gender: ref.watch(childProfileNotifier).gender,
                      dob: ref.watch(childProfileNotifier).dobController.text,
                      diagnosis: ref.watch(childProfileNotifier).diagnosis,
                      age: int.parse(
                        ref.watch(childProfileNotifier).ageController.text,
                      ),
                      triggers: ref
                          .watch(childProfileNotifier)
                          .triggersController
                          .text,
                      allergies: ref
                          .watch(childProfileNotifier)
                          .allergiesController
                          .text,
                      tags: ref
                          .watch(childProfileNotifier).tags,
                    ),
                  );
              if (context.mounted) {
                context.pushSuper(ChildProfileSummary());
              }
            },
            title: AppStrings.saveProfile,
            buttonIcon: Icon(
              CupertinoIcons.checkmark_alt_circle_fill,
              color: AppColors.neutralWhite,
            ),
          ),
          40.sbH,
        ],
      ),
    );
  }
}
