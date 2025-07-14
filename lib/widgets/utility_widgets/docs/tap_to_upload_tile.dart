import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/core/utility_state/docs/upload_doc_notifier.dart';

class TapToUploadTile extends ConsumerWidget {
  final Color? highlightColor;
  final Color? textColor;
  final VoidCallback? onTap;
  const TapToUploadTile({super.key, this.highlightColor, this.textColor, this.onTap,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if(onTap != null){
          onTap?.call();
          return;
        }
        ref.watch(uploadDocNotifier.notifier).selectFile(context);
      },
      child: RichText(
        text: TextSpan(
          text: AppStrings.tabToUpload,
          style: AppTextStyles.body4RegularInter(context).copyWith(
            decoration: TextDecoration.underline,
            color: highlightColor ?? AppColors.secondaryPop,
            fontWeight: FontWeight.w700,
          ),
          children: [
            TextSpan(
              text: AppStrings.tabToUploadTypes,
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: textColor ?? AppColors.slateCharcoal40),
            ),
          ],
        ),
      ),
    );
  }
}
