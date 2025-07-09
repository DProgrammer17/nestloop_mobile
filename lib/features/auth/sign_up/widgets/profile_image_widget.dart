import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/profile_image/profile_image_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class ProfileImageWidget extends ConsumerWidget {
  final ValueChanged<File?> profileImage;
  final double? size;
  const ProfileImageWidget({super.key, required this.profileImage, this.size,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: (size ?? 160).ah,
      width: (size ?? 160).aw,
      child: Stack(
        children: [
          Container(
            height: 148.ah,
            width: 148.aw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(51.ar),
              border: Border.all(
                width: 2.aw,
                color: AppColors.softSupportAccent2,
              ),
            ),
            child: ref.watch(imageProfileNotifier).image == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(51.ar),
                    child: Image.asset(
                      AppAssets.profileImagePlaceholder,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(51.ar),
                    child: Image.file(
                      ref.watch(imageProfileNotifier).image!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Positioned(
            bottom: 0.aw,
            right: 0.aw,
            child: InkWell(
              onTap: () async {
                if (ref.watch(imageProfileNotifier).image == null) {
                  await ref
                      .watch(imageProfileNotifier.notifier)
                      .updateProfileImage(
                        context: context,
                        onSuccess: () => profileImage.call(
                          ref.watch(imageProfileNotifier).image,
                        ),
                      );
                  return;
                }
                ref.watch(imageProfileNotifier.notifier).removePhoto();
                profileImage.call(null);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 9.5.ah,
                  horizontal: 9.aw,
                ),
                decoration: BoxDecoration(
                  color: AppColors.baseBackground,
                  borderRadius: BorderRadius.circular(56.ar),
                  border: Border.all(
                    width: 2.aw,
                    color: AppColors.softSupportAccent2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      size: 18.ar,
                      color: AppColors.slateCharcoalMain,
                    ),
                    5.sbW,
                    Text(
                      ref.watch(imageProfileNotifier).image == null
                          ? AppStrings.image
                          : AppStrings.remove,
                      style: AppTextStyles.body4RegularInter(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
