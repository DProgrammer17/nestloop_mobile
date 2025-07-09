import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/child_profile/child_profile_first_step.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/ui/child_profile/child_profile_second_page.dart';

class ChildProfileVM {
  final PageController profilePageController;
  final int profileCurrentPage;
  final GlobalKey<FormState> profileFormKey;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController dobController;
  final TextEditingController allergiesController;
  final TextEditingController triggersController;
  final TextEditingController therapyGoalsController;
  final TextEditingController dailyRoutineController;
  final TextEditingController tagsController;
  final List<Widget> profilePages;
  final List<File> profileDocuments;
  final List<String> profileFileNames;
  final List<String> tags;
  final List<String> tagSuggestions;
  final List<File> childDocs;
  final List<ChildProfileModel> childProfiles;
  final File? profileImage;
  final String gender;
  final String diagnosis;
  final bool showAllergies;
  final bool showTriggers;

  const ChildProfileVM({
    required this.profilePageController,
    required this.profileFormKey,
    required this.nameController,
    required this.ageController,
    required this.dobController,
    required this.allergiesController,
    required this.triggersController,
    required this.therapyGoalsController,
    required this.dailyRoutineController,
    required this.tagsController,
    this.profilePages = const [
      ChildProfileFirstStep(),
      ChildProfileSecondPage(),
    ],
    this.childProfiles = const [],
    this.profileDocuments = const [],
    this.profileFileNames = const [],
    this.childDocs = const [],
    this.tags = const [],
    this.tagSuggestions = const [
      AppStrings.nonVerbal,
      AppStrings.sensorySensitive,
      AppStrings.needsRoutine,
      AppStrings.highEnergy,
      AppStrings.visualLearner,
      AppStrings.signLanguage,
    ],
    this.gender = '',
    this.diagnosis = '',
    this.profileCurrentPage = 0,
    this.showAllergies = false,
    this.showTriggers = false,
    this.profileImage,
  });

  ChildProfileVM copyWith({
    PageController? profilePageController,
    GlobalKey<FormState>? profileFormKey,
    TextEditingController? nameController,
    TextEditingController? ageController,
    TextEditingController? dobController,
    TextEditingController? allergiesController,
    TextEditingController? triggersController,
    TextEditingController? therapyGoalsController,
    TextEditingController? dailyRoutineController,
    TextEditingController? tagsController,
    List<Widget>? profilePages,
    List<File>? profileDocuments,
    List<String>? profileFileNames,
    List<String>? tags,
    List<File>? childDocs,
    List<ChildProfileModel>? childProfiles,
    String? gender,
    String? diagnosis,
    int? profileCurrentPage,
    bool? showAllergies,
    bool? showTriggers,
    File? Function()? profileImage,
  }) {
    return ChildProfileVM(
      profilePageController:
          profilePageController ?? this.profilePageController,
      profileFormKey: profileFormKey ?? this.profileFormKey,
      nameController: nameController ?? this.nameController,
      ageController: ageController ?? this.ageController,
      dobController: dobController ?? this.dobController,
      tagsController: tagsController ?? this.tagsController,
      allergiesController: allergiesController ?? this.allergiesController,
      triggersController: triggersController ?? this.triggersController,
      therapyGoalsController:
          therapyGoalsController ?? this.therapyGoalsController,
      dailyRoutineController:
          dailyRoutineController ?? this.dailyRoutineController,
      profilePages: profilePages ?? this.profilePages,
      profileDocuments: profileDocuments ?? this.profileDocuments,
      profileFileNames: profileFileNames ?? this.profileFileNames,
      childDocs: childDocs ?? this.childDocs,
      tags: tags ?? this.tags,
      gender: gender ?? this.gender,
      diagnosis: diagnosis ?? this.diagnosis,
      profileCurrentPage: profileCurrentPage ?? this.profileCurrentPage,
      showAllergies: showAllergies ?? this.showAllergies,
      showTriggers: showTriggers ?? this.showTriggers,
      childProfiles: childProfiles ?? this.childProfiles,
      profileImage: profileImage != null ? profileImage() : this.profileImage,
    );
  }
}
