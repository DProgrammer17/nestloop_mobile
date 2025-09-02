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
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/textfield_outer_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/small_info_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/document_info_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/docs/tap_to_upload_tile.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

import '../../../core/utility_state/docs/upload_doc_notifier.dart'
    show uploadDocNotifier;

class UploadDocsTile extends ConsumerWidget {
  final ValueChanged<List<File>> files;
  const UploadDocsTile({super.key, required this.files});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WidgetCasing(
      outerContent: TextFieldOuterTile(
        leading: SvgPicture.asset(SvgAssets.uploadedIcon, height: 20.ah),
        title: AppStrings.uploadDocuments,
      ),
      content: Builder(
        builder: (context) {
          if (ref.watch(uploadDocNotifier).files.isEmpty) {
            return Container(
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
                    return TapToUploadTile(
                      onTap: () async {
                        await ref
                            .watch(uploadDocNotifier.notifier)
                            .selectFile(context)
                            .then(
                              (file) => files.call(
                                ref
                                    .watch(uploadDocNotifier)
                                    .files
                                    .map((e) => e.doc)
                                    .toList(),
                              ),
                            );
                      },
                    );
                  },
                ),
              ),
            );
          }
          return Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 200.ah),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10.ah,
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      ref.watch(uploadDocNotifier).files.length,
                      (index) => Container(
                        height: 161.ah,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.ar),
                          color: AppColors.neutralWhite,
                        ),
                        child: Center(
                          child: DocInfoTile(
                            fileName: ref
                                .watch(uploadDocNotifier)
                                .files
                                .elementAt(index)
                                .docName,
                            removeAction: () async => await ref
                                .watch(uploadDocNotifier.notifier)
                                .removeSelectedFile(
                                  ref
                                      .watch(uploadDocNotifier)
                                      .files
                                      .elementAt(index)
                                      .docName,
                                )
                                .then(
                                  (e) => files.call(
                                    ref
                                        .watch(uploadDocNotifier)
                                        .files
                                        .map((e) => e.doc)
                                        .toList(),
                                  ),
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (ref.watch(uploadDocNotifier).files.isNotEmpty) ...[
                8.sbH,
                Container(
                  padding: EdgeInsets.all(16.ar),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.baseBackground,
                    borderRadius: BorderRadius.circular(16.ar),
                  ),
                  child: Center(
                    child: TapToUploadTile(
                      onTap: () async {
                        await ref
                            .watch(uploadDocNotifier.notifier)
                            .selectFile(context)
                            .then(
                              (file) => files.call(
                                ref
                                    .watch(uploadDocNotifier)
                                    .files
                                    .map((e) => e.doc)
                                    .toList(),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
