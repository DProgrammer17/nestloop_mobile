import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_network_image.dart';

class PinnedMessagesWidget extends ConsumerWidget {
  const PinnedMessagesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Symbols.keep, size: 22.ar, color: AppColors.slateCharcoal60),
            2.sbW,
            Text(
              AppStrings.pinned,
              style: AppTextStyles.body2RegularInter(context).copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.slateCharcoal60,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 6.ah, horizontal: 6.aw),
          decoration: BoxDecoration(
            color: AppColors.slateCharcoal06,
            borderRadius: BorderRadius.circular(20.ar),
          ),
          child: Row(
            children: [
              Row(
                spacing: 6.aw,
                children: List.generate(
                  ref.watch(homeNotifier).messageUpdates.length > 3
                      ? 3
                      : ref.watch(homeNotifier).messageUpdates.length,
                  (index) => Stack(
                    children: [
                      AppNetworkImage(
                        image: ref
                            .watch(homeNotifier)
                            .messageUpdates
                            .elementAt(index)
                            .url,
                        height: 48.ah,
                        width: 48.aw,
                        radius: 18.ar,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 23.aw,
                          width: 23.ah,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.highlightCTARed,
                            shape: BoxShape.circle,
                            border: Border.all(width: 2.aw, color: AppColors.baseBackground),
                          ),
                          child: Text(
                            ref.watch(homeNotifier).messageUpdates.elementAt(index).unreadCount.toString(),
                            style: AppTextStyles.body2RegularInter(context).copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.baseBackground,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if( ref.watch(homeNotifier).messageUpdates.length > 3)...[
                6.sbW,
                Container(
                  height: 48.ah,
                  width: 48.aw,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.ar),
                    color: AppColors.baseBackground,
                  ),
                  child: Text(
                   '+${(ref.watch(homeNotifier).messageUpdates.length - 3)}',
                    style: AppTextStyles.body2RegularInter(context).copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
