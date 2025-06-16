import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';

class OnboardingModel{
  final List<String> onboardingImageList;
  final List<String> onboardingTitleList;
  final List<String> onboardingSubtextList;
  final PageController onboardingPageController;
  final int currentPage;

  const OnboardingModel({
    required this.onboardingPageController,
    this.currentPage = 0,
    this.onboardingImageList = const [
      AppAssets.onboardingImage1,
      AppAssets.onboardingImage2,
      AppAssets.onboardingImage3,
      AppAssets.onboardingImage4,
    ],
    this.onboardingTitleList = const [
      AppStrings.onboardingTitle1,
      AppStrings.onboardingTitle2,
      AppStrings.onboardingTitle3,
      AppStrings.onboardingTitle4,
    ],
    this.onboardingSubtextList = const [
      AppStrings.onboardingSubtitle1,
      AppStrings.onboardingSubtitle2,
      AppStrings.onboardingSubtitle3,
      AppStrings.onboardingSubtitle4,
    ],
  });

  OnboardingModel copyWith({
    List<String>? onboardingImageList,
    List<String>? onboardingTitleList,
    List<String>? onboardingSubtextList,
    PageController? onboardingPageController,
    int? currentPage,
  }){
    return OnboardingModel(
      onboardingImageList: onboardingImageList ?? this.onboardingImageList,
      onboardingTitleList: onboardingTitleList ?? this.onboardingTitleList,
      onboardingSubtextList: onboardingSubtextList ?? this.onboardingSubtextList,
      onboardingPageController: onboardingPageController ?? this.onboardingPageController,
      currentPage: currentPage ?? this.currentPage,
    );
  }
}