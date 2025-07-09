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
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/profile_image_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/tiles/info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class ChildOverviewPage extends ConsumerWidget{
  final ChildProfileModel model;
  const ChildOverviewPage({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileImageWidget(
            profileImage: (image) => ref
                .watch(childProfileNotifier.notifier)
                .updateProfileImage(image),
          ),
          15.sbH,
          WidgetCasing(
            padding: EdgeInsets.symmetric(
              vertical: 16.ah,
              horizontal: 16.aw,
            ),
            outerContent: SizedBox.shrink(),
            content: Column(
              children: [
                InfoTile(
                  headerIcon: SvgPicture.asset(
                    SvgAssets.profileNavIcon,
                    height: 24.ah,
                  ),
                  headerTitle: AppStrings.name,
                  info: model.name,
                ),
                16.sbH,
                InfoTile(
                  headerIcon: SvgPicture.asset(
                    SvgAssets.birthdayIcon,
                    height: 24.ah,
                  ),
                  headerTitle: AppStrings.age,
                  info: model.age.toString(),
                ),
                16.sbH,
                InfoTile(
                  headerIcon: Icon(
                    model.gender.toLowerCase().contains(
                      AppStrings.male.toLowerCase(),
                    )
                        ? Icons.male_sharp
                        : Icons.female_sharp,
                    size: 24.ar,
                    color: AppColors.slateCharcoal60,
                  ),
                  headerTitle: AppStrings.gender,
                  info: model.gender,
                ),
              ],
            ),
          ),
          15.sbH,
          WidgetCasing(
            padding: EdgeInsets.symmetric(
              vertical: 16.ah,
              horizontal: 16.aw,
            ),
            outerContent: SizedBox.shrink(),
            content: Column(
              children: [
                InfoTile(
                  headerIcon: SvgPicture.asset(
                    SvgAssets.diagnosisIcon,
                    height: 20.ah,
                    color: AppColors.slateCharcoal60,
                  ),
                  headerTitle: AppStrings.diagnosis,
                  infoContent: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 6.ah,
                      horizontal: 12.aw,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.ar),
                      color: AppColors.neutralWhite,
                    ),
                    child: Text(
                      model.diagnosis,
                      style: AppTextStyles.body1RegularInter(
                        context,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                16.sbH,
                InfoTile(
                  headerIcon: Icon(
                    Icons.label_outline_sharp,
                    size: 23.ar,
                    color: AppColors.slateCharcoal60,
                  ),
                  headerTitle: AppStrings.tags,
                  alignment: CrossAxisAlignment.start,
                  infoContent: SizedBox(
                    width: AppConstants.deviceWidth * 0.6,
                    child: Wrap(
                      alignment: WrapAlignment.end,
                      children: List.generate(
                        model.tags.length,
                            (index) => Container(
                          margin: EdgeInsets.symmetric(vertical: 4.ah, horizontal: 4.aw),
                          padding: EdgeInsets.symmetric(
                            vertical: 6.ah,
                            horizontal: 12.aw,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.ar),
                            color: AppColors.neutralWhite,
                          ),
                          child: Text(
                            model.tags.elementAt(index),
                            style: AppTextStyles.body1RegularInter(
                              context,
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          14.sbH,
          AppButton(
            width: double.infinity,
            onTap: () {},
            title: AppStrings.addAnotherChild,
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.neutralWhite,
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
            prefixButtonIcon: Icon(
              Icons.mode_edit_outlined,
              size: 22.ar,
              color: AppColors.highlightCTAOrange,
            ),
          ),
          80.sbH,
        ],
      ),
    );
  }

}