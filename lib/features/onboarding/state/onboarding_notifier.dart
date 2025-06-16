import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/features/onboarding/state/onboarding_model.dart';

final onboardingNotifier =
    NotifierProvider<OnboardingNotifier, OnboardingModel>(() {
      return OnboardingNotifier();
    });

class OnboardingNotifier extends Notifier<OnboardingModel> {
  @override
  OnboardingModel build() =>
      OnboardingModel(onboardingPageController: PageController());

  void updatePage(int page)=> state = state.copyWith(currentPage: page);
}
