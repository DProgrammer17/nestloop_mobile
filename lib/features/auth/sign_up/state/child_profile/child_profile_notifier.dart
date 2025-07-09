import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/child_profile_vm.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/child_profile/model/child_profile_model.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/profile_image/profile_image_notifier.dart';

final childProfileNotifier =
    NotifierProvider<ChildProfileNotifier, ChildProfileVM>(() {
      return ChildProfileNotifier();
    });

class ChildProfileNotifier extends Notifier<ChildProfileVM> {
  @override
  ChildProfileVM build() => ChildProfileVM(
    profilePageController: PageController(),
    profileFormKey: GlobalKey<FormState>(),
    nameController: TextEditingController(),
    ageController: TextEditingController(),
    dobController: TextEditingController(),
    allergiesController: TextEditingController(),
    triggersController: TextEditingController(),
    therapyGoalsController: TextEditingController(),
    dailyRoutineController: TextEditingController(),
    tagsController: TextEditingController(),
  );

  void updatePage(int page) => state = state.copyWith(profileCurrentPage: page);
  void updateProfileImage(File? image) =>
      state = state.copyWith(profileImage: () => image);
  void updateGender(String? gender) => state = state.copyWith(gender: gender);
  void updateDiagnosis(String? diagnosis) =>
      state = state.copyWith(diagnosis: diagnosis);
  void updateShowAllergies(bool show) =>
      state = state.copyWith(showAllergies: show);
  void updateShowTriggers(bool? show) =>
      state = state.copyWith(showTriggers: show);

  void addToTags(String tag) {
    List<String> interimList = state.tags.toList();
    if (interimList.any((e) => e.contains(tag))) {
      return;
    }
    interimList = interimList.toList()..add(tag);
    state = state.copyWith(tags: interimList.toList());
  }

  void removeFromTags(String tag) {
    List<String> interimList = state.tags.toList();
    interimList = interimList..remove(tag);
    state = state.copyWith(tags: interimList.toList());
  }

  void addToChildDocs(File doc) {
    List<File> interimList = state.childDocs.toList();
    interimList = interimList.toList()..add(doc);
    state = state.copyWith(childDocs: interimList.toList());
  }

  void removeFromChildDocs(File doc) {
    List<File> interimList = state.childDocs.toList();
    interimList = interimList..remove(doc);
    state = state.copyWith(childDocs: interimList.toList());
  }

  Future<void> addToProfile(ChildProfileModel child) async {
    List<ChildProfileModel> interimList = state.childProfiles.toList();
    if (interimList.any((e) => e.name.contains(child.name))) {
      interimList = interimList.toList()..remove(child);
    }
    interimList = interimList.toList()..add(child);
    state = state.copyWith(childProfiles: interimList.toList());
  }

  void removeFromChildProfile(ChildProfileModel child) {
    List<ChildProfileModel> interimList = state.childProfiles.toList();
    interimList = interimList..remove(child);
    state = state.copyWith(childProfiles: interimList.toList());
  }

  void clearProfileFields({
    required BuildContext context,
    required VoidCallback onSuccess,
  }) {
    state = state.copyWith(
      nameController: TextEditingController(),
      ageController: TextEditingController(),
      dobController: TextEditingController(),
      allergiesController: TextEditingController(),
      triggersController: TextEditingController(),
      therapyGoalsController: TextEditingController(),
      dailyRoutineController: TextEditingController(),
      tagsController: TextEditingController(),
      tags: const [],
      gender: '',
      diagnosis: '',
      profileImage: () => null,
      profileCurrentPage: 0,
    );
    ref.read(imageProfileNotifier.notifier).removePhoto();
    state.profilePageController.animateToPage(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    onSuccess.call();
  }
}
