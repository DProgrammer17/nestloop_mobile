import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/utility_state/docs/upload_doc_model.dart';
import 'package:nest_loop_mobile/utils/permissions/permissions_handler.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';

final uploadDocNotifier = NotifierProvider<UploadDocNotifier, UploadDocModel>(
  () {
    return UploadDocNotifier();
  },
);

class UploadDocNotifier extends Notifier<UploadDocModel> {
  @override
  UploadDocModel build() => UploadDocModel();

  void selectFile(BuildContext context) async {
    final permission = await PermissionHandler.checkPermission(
      context: context,
      permission: Permission.mediaLibrary,
    );
    if (!permission) {
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: ErrorStrings.permissionNotGranted,
        );
      }
      return;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      if (context.mounted) {
        if (fileSizeChecker(context, file)) {
          state = state.copyWith(
            file: () => file,
            fileName: () => file.uri.pathSegments.last,
          );
          return;
        }
      }
    } else {
      if (context.mounted) {
        AppMessages.showInfoMessage(
          context: context,
          message: AppStrings.processHasBeenTerminated,
        );
      }
    }
  }

  bool fileSizeChecker(BuildContext context, File selectedFile) {
    int sizeInBytes = selectedFile.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    if (sizeInMb > 5) {
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.fileIsLargerThan5,
      );
      return false;
    }

    return true;
  }

  void removeSelectedFile() =>
      state = state.copyWith(file: () => null, fileName: () => null);

  void openFile(File file) {
    OpenFile.open(file.path);
  }
}
