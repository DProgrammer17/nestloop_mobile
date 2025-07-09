import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/child_profile_notifier.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/widgets/onboarding_indicator.dart';
import 'package:nest_loop_mobile/widgets/page_widgets/app_scaffold.dart';

class ChildProfilePage extends ConsumerWidget {
  const ChildProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBarContent: OnboardingIndicator(
        sections: 2,
        currentSection: ref.watch(childProfileNotifier).profileCurrentPage,
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: ref.watch(childProfileNotifier).profilePageController,
        onPageChanged: (page) =>
            ref.watch(childProfileNotifier.notifier).updatePage(page),
        itemCount: ref.watch(childProfileNotifier).profilePages.length,
        itemBuilder: (BuildContext ctx, int index) =>
            ref.watch(childProfileNotifier).profilePages.elementAt(index),
      ),
    );
  }
}
