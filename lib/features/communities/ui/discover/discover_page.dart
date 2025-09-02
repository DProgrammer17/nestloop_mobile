import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_notifier.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/forum_info_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/discover/trending_post_widget.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';

class DiscoverPage extends ConsumerWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TrendingPostWidget(),
          24.sbH,
          Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
          24.sbH,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.popularForums,
                style: AppTextStyles.h5Inter(context).copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.slateCharcoalMain,
                ),
              ),
              Icon(Symbols.search, size: 26.ar, color: AppColors.primaryOrange),
            ],
          ),
          16.sbH,
          Column(
            spacing: 16.ah,
            children: List.generate(
              ref.watch(communitiesNotifier).forumList.length,
              (index) => ForumInfoWidget(
                info: ref.watch(communitiesNotifier).forumList.elementAt(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
