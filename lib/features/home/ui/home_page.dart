import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/auth/log_in/state/login_notifier.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
import 'package:nest_loop_mobile/features/home/ui/home_overview_page.dart';
import 'package:nest_loop_mobile/features/home/ui/home_updates/home_updates_page.dart';
import 'package:nest_loop_mobile/features/home/widget/home_page_appbar_content.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifier.notifier).getUserData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        padding: EdgeInsets.zero,
        appBackgroundColor: AppColors.slateCharcoalMain,
        appBarShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.ar)),
        ),
        appBarContent: HomePageAppBarContent(
          imageUrl:
              ref.watch(homeNotifier).userResponse?.avatar?.url ??
              ref.watch(loginNotifier).loginResponse?.user?.avatar ??
              '',
          name: ref.watch(homeNotifier).userResponse?.fullName ??  ref.watch(loginNotifier).loginResponse?.user?.fullName?.split(' ').first ?? '',
        ),
        appBarBottomContent: TabBar(
          indicatorColor: AppColors.neutralWhite,
          indicatorWeight: 2.5.aw,
          labelColor: AppColors.neutralWhite,
          labelStyle: AppTextStyles.body1RegularInter(
            context,
          ).copyWith(fontWeight: FontWeight.w700),
          unselectedLabelColor: AppColors.slateCharcoal40,
          unselectedLabelStyle: AppTextStyles.body1RegularInter(
            context,
          ).copyWith(color: AppColors.slateCharcoal40),
          onTap: (page) =>
              ref.watch(homeNotifier.notifier).updatePage(page),
          tabs: [
            Tab(
              icon: Icon(
                Symbols.face,
                size: 32.ar,
                color: ref.watch(homeNotifier).currentPage == 0
                    ? AppColors.neutralWhite
                    : AppColors.slateCharcoal40,
              ),
              iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
              text: AppStrings.overview,
            ),
            Tab(
              icon: Icon(
               Symbols.rss_feed,
                size: 32.ar,
                color: ref.watch(homeNotifier).currentPage == 1
                    ? AppColors.neutralWhite
                    : AppColors.slateCharcoal40,
              ),
              iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
              text: AppStrings.careDetails,
            ),
          ],
        ),
        centerTile: true,
        toolbarHeight: AppConstants.deviceHeight * 0.2,
        toolbarElevation: 0.2.ar,
        body: Container(
          color: AppColors.baseBackground,
          child: TabBarView(
            children: [
              HomeOverviewPage(),
              HomeUpdatesPage(),
            ],
          ),
        ),
      ),
    );
  }
}
