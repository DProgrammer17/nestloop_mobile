import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/utility_state/docs/upload_doc_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/document_info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/tap_to_upload_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CareDocumentsPage extends ConsumerWidget {
  final ChildProfileModel model;
  const CareDocumentsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (model.childDocs.isNotEmpty) ...[
            WidgetCasing(
              outerContent: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
              content: Column(
                spacing: 10.ah,
                children: List.generate(
                  model.childDocs.length,
                  (index) => DocumentInfoTile(
                    doc: model.childDocs.elementAt(index).doc,
                    docName: model.childDocs.elementAt(index).docName,
                    removeAction: () {},
                  ),
                ),
              ),
            ),
            14.sbH,
          ],
          AppButton(
            width: double.infinity,
            onTap: () =>
                ref.watch(uploadDocNotifier.notifier).selectFile(context),
            title: AppStrings.editCareDetails,
            titleContent: AbsorbPointer(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.add,
                    size: 22.ar,
                    color: AppColors.highlightCTAOrange,
                  ),
                  8.sbW,
                  TapToUploadTile(
                    highlightColor: AppColors.slateCharcoalMain,
                  ),
                ],
              ),
            ),
            buttonColor: AppColors.neutralWhite,
            borderColor: AppColors.slateCharcoal06,
            borderWidth: 2.aw,
            prefixButtonIcon: Icon(
              CupertinoIcons.add,
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
