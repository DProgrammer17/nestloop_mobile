import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/bottom_nav/state/bottom_nav_notifier.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/empty_appbar.dart';

class AppBottomNav extends ConsumerWidget {
  final int? currentIndex;
  const AppBottomNav({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      appBar: EmptyAppBar(),
      body: IndexedStack(
        index: ref.watch(bottomNavNotifier).currentIndex ?? 0,
        children: ref.watch(bottomNavNotifier).navPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(bottomNavNotifier).currentIndex ?? 0,
        onTap: (index) => ref
            .watch(bottomNavNotifier.notifier)
            .updateNavIndex(currentIndex ?? index),
        backgroundColor: AppColors.neutralWhite,
        elevation: 0,
        iconSize: 30.ar,
        selectedFontSize: 12.asp,
        unselectedFontSize: 12.asp,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.slateCharcoal40,
        selectedLabelStyle: AppTextStyles.body1RegularInter(
          context,
        ).copyWith(color: AppColors.primaryOrange, fontWeight: FontWeight.w700),
        unselectedLabelStyle: AppTextStyles.body1RegularInter(
          context,
        ).copyWith(color: AppColors.slateCharcoal40),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ref.watch(bottomNavNotifier).currentIndex == 0
                  ? SvgAssets.homeSelectedNavIcon
                  : SvgAssets.homeNavIcon,
              height: 28.ah,
              color: ref.watch(bottomNavNotifier).currentIndex == 0
                  ? AppColors.primaryOrange
                  : AppColors.slateCharcoal40,
            ),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ref.watch(bottomNavNotifier).currentIndex == 1
                  ? SvgAssets.profileSelectedNavIcon
                  : SvgAssets.profileNavIcon,
              height: 28.ah,
              color: ref.watch(bottomNavNotifier).currentIndex == 1
                  ? AppColors.primaryOrange
                  : AppColors.slateCharcoal40,
            ),
            label: AppStrings.profiles,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ref.watch(bottomNavNotifier).currentIndex == 2
                  ? SvgAssets.communitySelectedNavIcon
                  : SvgAssets.communityNavIcon,
              height: 28.ah,
              color: ref.watch(bottomNavNotifier).currentIndex == 2
                  ? AppColors.primaryOrange
                  : AppColors.slateCharcoal40,
            ),
            label: AppStrings.community,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              ref.watch(bottomNavNotifier).currentIndex == 3
                  ? SvgAssets.marketSelectedNavIcon
                  : SvgAssets.marketNavIcon,
              height: 28.ah,
              color: ref.watch(bottomNavNotifier).currentIndex == 3
                  ? AppColors.primaryOrange
                  : AppColors.slateCharcoal40,
            ),
            label: AppStrings.market,
          ),
          BottomNavigationBarItem(
            icon: Badge(
              offset: Offset(7, 0),
              backgroundColor: AppColors.baseRed,
              child: SvgPicture.asset(
                ref.watch(bottomNavNotifier).currentIndex == 4
                    ? SvgAssets.inboxSelectedNavIcon
                    : SvgAssets.inboxNavIcon,
                height: 28.ah,
                color: ref.watch(bottomNavNotifier).currentIndex == 4
                    ? AppColors.primaryOrange
                    : AppColors.slateCharcoal40,
              ),
            ),
            label: AppStrings.inbox,
          ),
        ],
      ),
    );
  }
}
