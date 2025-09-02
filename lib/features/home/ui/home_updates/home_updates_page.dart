import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/ui/home_updates/community_updates.dart';
import 'package:nest_loop_mobile/features/home/ui/home_updates/marketplace_updates.dart';
import 'package:nest_loop_mobile/features/home/ui/home_updates/message_updates.dart';
import 'package:nest_loop_mobile/features/home/ui/home_updates/task_updates.dart';

class HomeUpdatesPage extends ConsumerWidget{
  const HomeUpdatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          TabBar(
            indicatorColor: AppColors.slateCharcoalMain,
            indicatorWeight: 2.5.aw,
            labelColor: AppColors.slateCharcoalMain,
            labelStyle: AppTextStyles.body1RegularInter(
              context,
            ).copyWith(fontWeight: FontWeight.w700),
            unselectedLabelColor: AppColors.slateCharcoal40,
            unselectedLabelStyle: AppTextStyles.body1RegularInter(
              context,
            ).copyWith(color: AppColors.slateCharcoal40),
            onTap: (page) =>
                ref.watch(homeNotifier.notifier).homeUpdatePage(page),
            tabs: [
              Tab(
                icon: Icon(
                  Symbols.done_all,
                  size: 32.ar,
                  color: ref.watch(homeNotifier).updatesCurrentPage == 0
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal40,
                ),
                iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
                text: AppStrings.tasks,
              ),
              Tab(
                icon: Icon(
                  Symbols.chat_bubble,
                  size: 32.ar,
                  color: ref.watch(homeNotifier).updatesCurrentPage == 1
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal40,
                ),
                iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
                text: AppStrings.messages,
              ),
              Tab(
                icon: Icon(
                  Symbols.handshake,
                  size: 32.ar,
                  color: ref.watch(homeNotifier).updatesCurrentPage == 2
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal40,
                ),
                iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
                text: AppStrings.community,
              ),
              Tab(
                icon: Icon(
                  Symbols.store,
                  size: 32.ar,
                  color: ref.watch(homeNotifier).updatesCurrentPage == 3
                      ? AppColors.slateCharcoalMain
                      : AppColors.slateCharcoal40,
                ),
                iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
                text: AppStrings.marketPlace,
              ),
            ],
          ),
          Divider(
            thickness: 1.aw,
            color: AppColors.slateCharcoal06,
          ),
          Expanded(
            child: TabBarView(
              children: [
                TaskUpdates(),
                MessageUpdate(),
                CommunityUpdatesPage(),
                MarketUpdatesPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }

}