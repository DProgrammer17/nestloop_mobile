import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_notifier.dart';
import 'package:nest_loop_mobile/features/communities/widgets/community_post_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/groups/create_group_widget.dart';
import 'package:nest_loop_mobile/features/communities/widgets/groups/group_info_tile.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/floating_button_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/buttons/app_button.dart';

class MyGroupPage extends ConsumerWidget {
  const MyGroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingWidgetScaffold(
      floatingWidget: AppButton(
        onTap: () {},
        title: AppStrings.sos,
        gradient: AppColors.sosGradient,
        prefixButtonIcon: Icon(
          Symbols.e911_emergency,
          size: 22.ar,
          color: AppColors.neutralWhite,
        ),
        borderColor: AppColors.neutralWhite,
        borderWidth: 4.aw,
      ),
      pageContent: SingleChildScrollView(
        child: Column(
          children: [
            CreateGroupWidget(),
            24.sbH,
            Divider(thickness: 1.aw, color: AppColors.slateCharcoal06),
            24.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.yourGroups,
                  style: AppTextStyles.h5Inter(
                    context,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  AppStrings.seeAll,
                  style: AppTextStyles.h3Inter(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryOrange,
                  ),
                ),
              ],
            ),
            16.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8.aw,
              children: List.generate(
                ref.watch(communitiesNotifier).forumList.length > 2
                    ? 2
                    : ref.watch(communitiesNotifier).forumList.length,
                (index) => GroupInfoTile(
                  groupModel: ref
                      .watch(communitiesNotifier)
                      .forumList
                      .elementAt(index),
                ),
              ),
            ),
            24.sbH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.recentActivity,
                  style: AppTextStyles.h5Inter(
                    context,
                  ).copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  AppStrings.more,
                  style: AppTextStyles.h3Inter(context).copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryOrange,
                  ),
                ),
              ],
            ),
            16.sbH,
            Column(
              spacing: 16.ah,
              children: List.generate(
                ref.watch(communitiesNotifier).posts.length > 5
                    ? 5
                    : ref.watch(communitiesNotifier).posts.length,
                (index) => CommunityPostWidget(
                  onRepliesTap: () => ref
                      .watch(communitiesNotifier.notifier)
                      .showRepliesModal(
                        context: context,
                        postId: ref
                            .watch(communitiesNotifier)
                            .posts
                            .elementAt(index)
                            .id,
                      ),
                  post: ref.watch(communitiesNotifier).posts.elementAt(index),
                ),
              ),
            ),
            30.sbH,
          ],
        ),
      ),
    );
  }
}
