import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_text_field.dart';

class WriteReplyWidget extends ConsumerWidget{
  const WriteReplyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: 16.ah, bottom: 24.ah),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppTextField(
            height: 52.ah,
            width: 260.aw,
            verticalPadding: 0,
            horizontalPadding: 0,
            controller: ref.watch(communitiesNotifier).replyController,
            backgroundColor: AppColors.slateCharcoal06,
            hintText: AppStrings.replyHintText,
          ),
          6.sbW,
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12.ah, horizontal: 12.aw),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.ar),
              color: AppColors.baseBackground,
              border: Border.all(
                width: 1.aw,
                color: AppColors.slateCharcoal06,
              ),
            ),
            child: Icon(
              Symbols.animated_images,
              size: 27.ar,
              color: AppColors.slateCharcoalMain,
            ),
          ),
          6.sbW,
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12.ah, horizontal: 12.aw),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.ar),
              color: AppColors.primaryOrange,
            ),
            child: Icon(
              Symbols.send,
              size: 27.ar,
              color: AppColors.baseBackground,
            ),
          ),
        ],
      ),
    );
  }

}