import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/messages/message_info_tile.dart';
import 'package:nest_loop_mobile/features/home/widget/updates_widgets/messages/pinned_messages_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_text_field.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/widget_casing.dart';

class MessageUpdate extends ConsumerWidget {
  const MessageUpdate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.ah, horizontal: 12.aw),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: ref.watch(homeNotifier).searchMessagesController,
              borderRadius: 16.ar,
              backgroundColor: AppColors.slateCharcoal06,
              horizontalPadding: 0,
              hintText: AppStrings.searchMessagesHint,
              prefixIcon: Icon(
                Symbols.search,
                size: 22.ar,
                color: AppColors.slateCharcoal80,
              ),
            ),
            12.sbH,
            PinnedMessagesWidget(),
            12.sbH,
            Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
            24.sbH,
            Text(
              AppStrings.recent,
              style: AppTextStyles.body2RegularInter(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.slateCharcoal60,
              ),
            ),
            10.sbH,
            WidgetCasing(
              padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
              contentSpacing: 0,
              outerContent: SizedBox.shrink(),
              content: Column(
                spacing: 7.ah,
                children: List.generate(
                  ref.watch(homeNotifier).messageUpdates.length,
                  (index) => MessageInfoTile(
                    message: ref
                        .watch(homeNotifier)
                        .messageUpdates
                        .elementAt(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
