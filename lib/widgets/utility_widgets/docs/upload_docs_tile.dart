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
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/tap_to_upload_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

import '../../../core/utility_state/docs/upload_doc_notifier.dart'
    show uploadDocNotifier;

class UploadDocsTile extends ConsumerWidget {
  const UploadDocsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetCasing(
      outerContent: TextFieldOuterTile(
        leading: SvgPicture.asset(SvgAssets.uploadedIcon, height: 20.ah),
        title: AppStrings.uploadDocuments,
      ),
      content: Column(
        children: [
          Container(
            height: 161.ah,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.ar),
              color: AppColors.neutralWhite,
            ),
            child: Center(
              child: Builder(
                builder: (context) {
                  if (ref.watch(uploadDocNotifier).file == null) {
                    return TapToUploadTile();
                  }
                  return Column(
                    children: [
                      SvgPicture.asset(SvgAssets.uploadedDocsIcon, height: 40.ah),
                      10.33.sbH,
                      RichText(
                        text: TextSpan(
                          text: ref.watch(uploadDocNotifier).fileName,
                          style: AppTextStyles.body4RegularInter(context)
                              .copyWith(
                                decoration: TextDecoration.underline,
                                color: AppColors.secondaryPop,
                              ),
                          children: [
                            TextSpan(
                              text: AppStrings.uploaded,
                              style: AppTextStyles.body2RegularInter(
                                context,
                              ).copyWith(color: AppColors.slateCharcoal40),
                            ),
                          ],
                        ),
                      ),
                      24.sbH,
                      SmallInfoButton(
                        leading: Icon(CupertinoIcons.trash, size: 14.ar),
                        title: AppStrings.remove,
                        onTap: () => ref
                            .watch(uploadDocNotifier.notifier)
                            .removeSelectedFile(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          if (ref.watch(uploadDocNotifier).file != null) ...[
            8.sbH,
            Container(
              padding: EdgeInsets.all(16.ar),
              alignment: Alignment.center,
              child: Center(child: TapToUploadTile()),
            ),
          ],
        ],
      ),
    );
  }
}
