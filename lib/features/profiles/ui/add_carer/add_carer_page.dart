import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/onboarding_indicator.dart';
import 'package:nest_loop_mobile/features/profiles/state/add_carer/add_carer_notifier.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';

class AddCarerPage extends ConsumerWidget {
  const AddCarerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      padding: EdgeInsets.symmetric(horizontal: 13.aw),
      appBarContent: OnboardingIndicator(
        sections: 4,
        midSpacing: 12,
        currentSection: ref.watch(addCarerNotifier).carerCurrentPage,
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: ref.watch(addCarerNotifier).carerPageController,
        onPageChanged: (page) =>
            ref.watch(addCarerNotifier.notifier).updatePage(page),
        itemCount: ref.watch(addCarerNotifier).carerPages.length,
        itemBuilder: (BuildContext ctx, int index) =>
            ref.watch(addCarerNotifier).carerPages.elementAt(index),
      ),
    );
  }
}
