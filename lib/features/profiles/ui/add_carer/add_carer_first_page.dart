import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/features/profiles/widgets/add_carer/suggested_contact_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';
import 'package:pinput/pinput.dart';

class AddCarerFirstPage extends ConsumerWidget {
  const AddCarerFirstPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(alignment: Alignment.topLeft, child: AppBackButton()),
          32.sbH,
          OnboardingHeaderWidget(
            header: AppStrings.addCarer,
            subtext: AppStrings.addCarerSubtitle,
          ),
          32.sbH,
          CasingAppTextfield(
            controller: ref.watch(addCarerNotifier).carerNameController,
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Icons.person_outlined,
                size: 21.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.emailOrUsername,
            ),
            hintText: AppStrings.emailOrUsernameHint,
            horizontalPadding: 0,
            onChanged: (value) => ref
                .watch(addCarerNotifier.notifier)
                .filterContacts(query: value),
            suffixIcon: InkWell(
              onTap: () =>
                  ref.watch(addCarerNotifier.notifier).getCareProvider(context),
              child: Icon(
                CupertinoIcons.search,
                size: 22.ar,
                color: AppColors.slateCharcoal80,
              ),
            ),
          ),
          24.sbH,
          WidgetCasing(
            backgroundColor: AppColors.pastelGreen,
            padding: EdgeInsets.fromLTRB(4.5.aw, 8.ah, 4.5.aw, 3.ah),
            outerContent: TextFieldOuterTile(
              leading: SvgPicture.asset(
                SvgAssets.lightbulbIcon,
                height: 30.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.suggestedProvider,
              titleStyle: AppTextStyles.body4RegularInter(
                context,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
            content: WidgetCasing(
              padding: EdgeInsets.zero,
              outerContent: SizedBox.shrink(),
              backgroundColor: AppColors.baseBackground,
              content: Builder(
                builder: (_) {
                  if (ref.watch(addCarerNotifier).gettingCareProviders) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 8.aw,
                      children: List.generate(
                        3,
                        (index) => Container(
                          height: 6.ah,
                          width: 6.aw,
                          decoration: BoxDecoration(
                            color: AppColors.pastelGreen,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }

                  if (ref.watch(addCarerNotifier).providers.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 8.ah),
                      child: Center(
                        child: Text(
                          AppStrings.noProvidersAvailable,
                          style: AppTextStyles.h2Inter(
                            context,
                          ).copyWith(color: AppColors.slateCharcoal60),
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.aw),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 272.ah),
                      child: Column(
                        children: List.generate(
                          ref.watch(addCarerNotifier).providers.length,
                          (index) => Column(
                            children: [
                              SuggestedCareProviderInfoTile(
                                onTap: (provider) => ref
                                    .watch(addCarerNotifier.notifier)
                                    .updateSelectedCareProvider(provider),
                                providerInfo: ref
                                    .watch(addCarerNotifier)
                                    .providers
                                    .elementAt(index),
                                selected: ref
                                    .watch(addCarerNotifier)
                                    .selectedCareProvider != null &&
                                    (ref
                                                .watch(addCarerNotifier)
                                                .selectedCareProvider
                                                !.id!).contains(
                                          ref
                                                  .watch(addCarerNotifier)
                                                  .providers
                                                  .elementAt(index)
                                                  .id!,
                                        ) ??
                                    false,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.ah),
                                child: Divider(
                                  thickness: 1.aw,
                                  color: AppColors.slateCharcoal06,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          16.sbH,
          CasingAppTextfield(
            height: 154.ah,
            controller: ref.watch(addCarerNotifier).personalMessageController,
            outerTitle: AppStrings.personalMessage,
            style: AppTextStyles.h3Inter(
              context,
            ).copyWith(fontWeight: FontWeight.w500),
            showOuterTile: true,
            suffixOuterTitle: Padding(
              padding: EdgeInsets.only(right: 8.aw),
              child: Text(
                AppStrings.optional,
                style: AppTextStyles.body2RegularInter(context).copyWith(
                  color: AppColors.slateCharcoal40,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            outerTileSpacing: 20,
            hintText: AppStrings.addPersonalNote,
            horizontalPadding: 0,
            expand: true,
            minLines: null,
            maxLines: null,
            showInfo: true,
            fieldInfoAlignment: Alignment.centerRight,
            fieldInfo: AppStrings.textFieldLengthCount(
              currentCount: ref
                  .watch(addCarerNotifier)
                  .personalMessageController
                  .length,
            ),
            fieldInfoStyle: AppTextStyles.body1RegularInter(context).copyWith(
              color: AppColors.slateCharcoal60,
              fontWeight: FontWeight.w500,
            ),
          ),
          32.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          16.sbH,
          AppButton(
            onTap: () => ref.watch(addCarerNotifier.notifier).validateFirstPage(context),
            title: AppStrings.next,
            buttonIcon: SvgPicture.asset(
              SvgAssets.arrowCircleRightIcon,
              height: 24.ah,
              width: 24.aw,
              color: AppColors.neutralWhite,
            ),
          ),
          10.sbH,
          AppButton(
            onTap: () => context.popSuper(),
            title: AppStrings.cancel,
            textColor: AppColors.slateCharcoalMain,
            buttonColor: AppColors.baseBackground,
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
          ),
          30.sbH,
        ],
      ),
    );
  }
}
