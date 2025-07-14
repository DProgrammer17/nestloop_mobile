import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/auth/log_in/state/login_notifier.dart';
import 'package:nest_loop_mobile/features/home/state/home_notifier.dart';
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
    return AppScaffold(
      backgroundColor: AppColors.neutralWhite,
      appBarContent: HomePageAppBarContent(
        imageUrl:
            ref.watch(homeNotifier).userResponse?.data?.avatar?.url ??
            ref.watch(loginNotifier).loginResponse?.user?.avatar ??
            '',
        name: ref.watch(homeNotifier).userResponse?.data?.fullName ??  ref.watch(loginNotifier).loginResponse?.user?.fullName?.split(' ').first ?? '',
      ),
      centerTile: true,
      toolbarHeight: 120.ah,
      toolbarElevation: 0.2.ar,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 24.ah, horizontal: 16.aw),
        color: AppColors.baseBackground,
        child: SingleChildScrollView(
          child: RefreshIndicator(
            onRefresh: () =>
                ref.watch(homeNotifier.notifier).getUserData(context),
            child: Column(children: []),
          ),
        ),
      ),
    );
  }
}
