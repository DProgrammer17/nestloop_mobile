import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';

class AddCarerInvitationSent extends ConsumerWidget {
  const AddCarerInvitationSent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(SvgAssets.invitationSentIcon, height: 70.ah),
            8.sbH,
            Text(
              AppStrings.invitationSent,
              style: AppTextStyles.h1Inter(context).copyWith(fontSize: 24.asp),
            ),
            10.sbH,
            Text(
              AppStrings.nameWillReceiveEmail(
                ref.watch(addCarerNotifier).carerNameController.text,
              ),
              textAlign: TextAlign.center,
              style: AppTextStyles.body4RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal60),
            ),
          ],
        ),
      ),
    );
  }
}
