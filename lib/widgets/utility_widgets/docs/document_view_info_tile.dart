import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/core/utility_state/docs/upload_doc_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_webview_widget.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';

class DocumentViewInfoTile extends ConsumerWidget {
  final File? doc;
  final String docName;
  final String? fileUrl;
  final VoidCallback removeAction;
  const DocumentViewInfoTile({
    super.key,
    this.doc,
    this.fileUrl,
    required this.docName,
    required this.removeAction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(16.ar),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.ar),
        color: AppColors.neutralWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgAssets.uploadedDocsIcon, height: 40.ah),
          10.33.sbH,
          Text(
            docName,
            style: AppTextStyles.body4RegularInter(context).copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.secondaryPop,
            ),
          ),
          24.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmallInfoButton(
                leading: Icon(
                  CupertinoIcons.trash,
                  size: 14.ar,
                  color: AppColors.baseRed,
                ),
                title: AppStrings.remove,
                onTap: removeAction,
              ),
              8.sbW,
              SmallInfoButton(
                leading: Icon(
                  Icons.visibility_outlined,
                  size: 14.ar,
                  color: AppColors.baseBlack,
                ),
                title: AppStrings.view,
                onTap: () {
                  if (fileUrl != null) {
                    context.pushSuper(
                      AppWebViewWidget(url: fileUrl!, title: docName),
                    );
                    return;
                  }

                  if (doc != null) {
                    ref.watch(uploadDocNotifier.notifier).openFile(doc!);
                    return;
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
