import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_notifier.dart';
import 'package:nest_loop_mobile/features/communities/ui/discover/discover_page.dart';
import 'package:nest_loop_mobile/features/communities/ui/groups/my_groups_page.dart';
import 'package:nest_loop_mobile/features/communities/ui/sos/sos_page.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/onboarding_header_widget.dart';

class CommunitiesPage extends ConsumerWidget{
  const CommunitiesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   return DefaultTabController(
     length: 4,
     child: AppScaffold(
       padding: EdgeInsets.zero,
       centerTile: true,
       toolbarHeight: 100.ah,
       appBarContent:  OnboardingHeaderWidget(
         header: AppStrings.community,
         subtext: AppStrings.communitySub,
       ),
       appBarBottomContent: TabBar(
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
             ref.watch(communitiesNotifier.notifier).updatePage(page),
         tabs: [
           Tab(
             icon: Icon(
               Symbols.group,
               size: 33.ar,
               color: ref.watch(communitiesNotifier).currentPage == 0
                   ? AppColors.slateCharcoalMain
                   : AppColors.slateCharcoal40,
             ),
             iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
             text: AppStrings.myGroups,
           ),
           Tab(
             icon: Icon(
              Symbols.e911_emergency,
               size: 33.ar,
               color: ref.watch(communitiesNotifier).currentPage == 1
                   ? AppColors.slateCharcoalMain
                   : AppColors.slateCharcoal40,
             ),
             iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
             text: AppStrings.sosCircle,
           ),
           Tab(
             icon: Icon(
               Symbols.search,
               size: 33.ar,
               color: ref.watch(communitiesNotifier).currentPage == 2
                   ? AppColors.slateCharcoalMain
                   : AppColors.slateCharcoal40,
             ),
             iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
             text: AppStrings.discover,
           ),
           Tab(
             icon: Icon(
               Symbols.bookmark,
               size: 33.ar,
               color: ref.watch(communitiesNotifier).currentPage == 3
                   ? AppColors.slateCharcoalMain
                   : AppColors.slateCharcoal40,
             ),
             iconMargin: EdgeInsets.symmetric(vertical: 2.ah),
             text: AppStrings.saved,
           ),
         ],
       ),
       body: Container(
     padding: EdgeInsets.symmetric(vertical: 24.ah, horizontal: 16.aw),
     color: AppColors.baseBackground,
     child: TabBarView(
       children: [
         MyGroupPage(),
         SosPage(),
         DiscoverPage(),
         SizedBox(),
       ],
     ),
   ),),
   );
  }

}