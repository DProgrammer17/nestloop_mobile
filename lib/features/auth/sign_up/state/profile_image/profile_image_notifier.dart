import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/profile_image/profile_image_vm.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/utils/permissions/permissions_handler.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dialogs/app_platform_dialog.dart';
import 'package:permission_handler/permission_handler.dart';

final imageProfileNotifier =
    NotifierProvider<ProfileImageNotifier, ProfileImageVM>(() {
      return ProfileImageNotifier();
    });

class ProfileImageNotifier extends Notifier<ProfileImageVM> {
  @override
  ProfileImageVM build() => ProfileImageVM();

  Future<void> updateProfileImage({
    required BuildContext context,
    required VoidCallback onSuccess,
  }) async {
    final ImagePicker picker = ImagePicker();
    File? selectedImage;

    showPlatformActionDialog(
      context: context,
      title: Text(
        AppStrings.selectAnImage,
        style: AppTextStyles.h3Inter(
          context,
        ).copyWith(color: AppColors.primaryOrange),
      ),
      actions: [
        (context) => AppButton(
          width: double.infinity,
          onTap: () async {
            final permission = await PermissionHandler.checkPermission(
              context: context,
              permission: Permission.camera,
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
            // Pick an image.
            final XFile? image = await picker.pickImage(
              source: ImageSource.camera,
            );
            if (image != null) {
              selectedImage = File(image.path);
              state = state.copyWith(
                image: () => selectedImage,
                imageName: selectedImage == null
                    ? ''
                    : selectedImage!.uri.pathSegments.last,
              );
              onSuccess.call();
              if (context.mounted) {
                context.popSuper();
              }
              return;
            }
            if (context.mounted) {
              AppMessages.showInfoMessage(
                context: context,
                message: AppStrings.processHasBeenTerminated,
              );
            }
          },
          title: AppStrings.takeAPicture,
        ),
        (context) => 10.sbH,
        (context) => AppButton(
          width: double.infinity,
          onTap: () async {
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

            // Capture a photo.
            final XFile? photo = await picker.pickImage(
              source: ImageSource.gallery,
            );
            if (photo != null) {
              selectedImage = File(photo.path);
              state = state.copyWith(
                image: () => selectedImage,
                imageName: selectedImage == null
                    ? ''
                    : selectedImage!.uri.pathSegments.last,
              );
              onSuccess.call();
              if (context.mounted) {
                context.popSuper();
              }
              return;
            }
            if (context.mounted) {
              AppMessages.showInfoMessage(
                context: context,
                message: AppStrings.processHasBeenTerminated,
              );
            }
          },
          title: AppStrings.openGallery,
        ),
      ],
    );
  }

  void removePhoto() =>
      state = state.copyWith(image: () => null, imageName: '');
}
