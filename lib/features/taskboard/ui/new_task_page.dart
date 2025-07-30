import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/features/taskboard/state/taskboard_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_back_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/casing_app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class NewTaskPage extends ConsumerWidget {
  const NewTaskPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      padding: EdgeInsets.symmetric(horizontal: 16.aw),
      appBarContent: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: AppBackButton(size: 30.ar),
          ),
          32.sbH,
          OnboardingHeaderWidget(
            header: AppStrings.newTask,
            subtext: AppStrings.createATask,
          ),
        ],
      ),
      centerTile: true,
      toolbarHeight: 145.ah,
      body: Column(
        children: [
          CasingAppTextfield(
            controller: ref.watch(taskBoardNotifier).taskNameController,
            outerContent: TextFieldOuterTile(
              leading: Icon(
                Icons.check,
                size: 21.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.taskName,
            ),
            hintText: AppStrings.taskNameHint,
            horizontalPadding: 0,
          ),
          8.sbH,
          WidgetCasing(
            outerContent: TextFieldOuterTile(
              leading: SvgPicture.asset(
                SvgAssets.categorySearchIcon,
                height: 26.ar,
                color: AppColors.slateCharcoalMain,
              ),
              title: AppStrings.taskCategory,
            ),
            content: Wrap(
              children: [

              ],
            ),),
        ],
      ),
    );
  }
}
