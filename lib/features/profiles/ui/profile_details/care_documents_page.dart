import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/utility_state/docs/upload_doc_notifier.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/document_view_info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/tap_to_upload_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class CareDocumentsPage extends ConsumerWidget {
  final ChildData model;
  const CareDocumentsPage({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (model.documents != null && model.documents!.isNotEmpty) ...[
            WidgetCasing(
              outerContent: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(vertical: 16.ah, horizontal: 16.aw),
              content: Column(
                spacing: 10.ah,
                children: List.generate(
                  model.documents!.length,
                  (index) => DocumentViewInfoTile(
                    fileUrl: model.documents!.elementAt(index).url,
                    docName: model.documents!.elementAt(index).name ?? '',
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
