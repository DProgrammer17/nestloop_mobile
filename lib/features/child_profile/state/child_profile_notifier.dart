import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_assets.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/core/utility_state/docs/upload_doc_notifier.dart';
import 'package:nest_loop_mobile/features/child_profile/state/child_diagnosis.dart';
import 'package:nest_loop_mobile/features/child_profile/state/child_profile_vm.dart';
import 'package:nest_loop_mobile/features/auth/sign_up/state/profile_image/profile_image_notifier.dart';
import 'package:nest_loop_mobile/features/child_profile/ui/child_profile_summary.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/child_profile_api.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/create_child_profile_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/delete_child_profile_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/update_child_profile_request.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/utils/extensions/navigation.dart';
import 'package:nest_loop_mobile/utils/extensions/string_extensions.dart';
import 'package:nest_loop_mobile/utils/helper_utils.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';

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
  void updateChildDocs(List<File> files) =>
      state = state.copyWith(childDocs: files);
  void toggleLoading(bool loading) =>
      state = state.copyWith(isLoading: loading);

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

  void editRoutineInfo({required int id, String? time, String? routine}) {
    RoutineInfo routineInfo = RoutineInfo.empty();
    bool exists = false;
    if (state.childRoutine.any((e) => e.id == id)) {
      routineInfo = state.childRoutine.firstWhere((e) => e.id == id);
      exists = true;
      removeFromRoutines(id);
    }
    if (time.isNotBlank) {
      routineInfo = RoutineInfo(
        id: id,
        time: time!,
        routine: exists ? routineInfo.routine : '',
      );
    }
    if (routine.isNotBlank) {
      routineInfo = RoutineInfo(
        id: id,
        time: exists ? routineInfo.time : '',
        routine: routine!,
      );
    }

    addToRoutines(routineInfo);
  }

  void addToRoutines(RoutineInfo info) {
    List<RoutineInfo> interimList = state.childRoutine.toList();
    if (interimList.any((e) => (e.id == info.id))) {
      interimList = interimList.toList()..remove(info);
    }
    interimList = interimList.toList()..add(info);
    state = state.copyWith(childRoutine: interimList.toList());
  }

  void removeFromRoutines(int index) {
    List<RoutineInfo> interimList = state.childRoutine.toList();
    interimList = interimList..removeWhere((e) => e.id == index);
    state = state.copyWith(childRoutine: interimList.toList());
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

  Future<void> addToProfile(ChildData child) async {
    List<ChildData> interimList = state.childProfiles.toList();
    if (interimList.any((e) => (e.id ?? '').contains(child.id ?? ''))) {
      interimList = interimList.toList()..remove(child);
    }
    interimList = interimList.toList()..add(child);
    state = state.copyWith(childProfiles: interimList.toList());
  }

  void removeFromChildProfile(ChildData child) {
    List<ChildData> interimList = state.childProfiles.toList();
    interimList = interimList..remove(child);
    state = state.copyWith(childProfiles: interimList.toList());
  }

  Future<void> loadDiagnoses() async {
    final String jsonString = await rootBundle.loadString(
      JSONAssets.childDiagnosis,
    );
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final List<dynamic> diagnosesJson = jsonMap['diagnoses'];

    List<ChildDiagnosis> diagnosis = diagnosesJson
        .map((json) => ChildDiagnosis.fromJson(json as Map<String, dynamic>))
        .toList();

    state = state.copyWith(childDiagnosis: diagnosis);
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
      childDocs: const [],
      tags: const [],
      gender: '',
      diagnosis: '',
      profileImage: () => null,
      profileCurrentPage: 0,
      showAllergies: false,
      showTriggers: false,
    );
    ref.read(uploadDocNotifier.notifier).clearDocsList();
    ref.read(imageProfileNotifier.notifier).removePhoto();
    state.profilePageController.animateToPage(
      0,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
    onSuccess.call();
  }

  void validateChildProfileFirstPage(BuildContext context) {
    if (state.profileImage == null) {
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.pleaseUploadAPhoto,
      );
      return;
    }
    if (state.profileImage != null &&
        state.nameController.text.isNotEmpty &&
        state.dobController.text.isNotEmpty &&
        state.gender.isNotBlank) {
      state.profilePageController.nextPage(
        duration: Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      updatePage(1);
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseFillAllFields,
    );
  }

  ///CREATE CHILD API CALL
  Future<void> validateCreateChildProfileCall(BuildContext context) async {
    if (state.profileImage != null &&
        state.nameController.text.isNotEmpty &&
        state.dobController.text.isNotEmpty &&
        state.gender.isNotBlank &&
        state.childDocs.isNotEmpty) {
      if (state.childProfiles.any(
        (e) => e.name!.contains(state.nameController.text),
      )) {
        updateChildProfile(
          context: context,
          id:
              state.childProfiles
                  .firstWhere(
                    (e) => e.name!.contains(state.nameController.text),
                  )
                  .id ??
              '',
        );
        return;
      }

      createChildProfile(context);
      return;
    }
    AppMessages.showErrorMessage(
      context: context,
      message: ErrorStrings.pleaseFillAllFields,
    );
  }

  Future<void> createChildProfile(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);
    List<MultipartFile> documents = await HelperUtils.convertFilesToMultipart(
      state.childDocs,
    );
    final avatar = await HelperUtils.convertFileToMultipart(
      state.profileImage!,
    );

    try {
      final response = await ChildProfileApi.createChildProfile(
        authToken: authToken,
        request: CreateChildProfileRequest(
          name: state.nameController.text,
          dateOfBirth: state.dobController.text.toDateYMD,
          gender: state.gender.toUpperCase(),
          diagnoses: state.diagnosis.toStringList,
          allergies: state.allergiesController.text.toStringList,
          triggers: state.triggersController.text.toStringList,
          therapyGoals: state.therapyGoalsController.text.toStringList,
          dailyRoutine: state.childRoutine,
          tags: state.tags,
          documents: documents,
          avatar: avatar,
        ),
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
        await addToProfile(response.data ?? ChildData());
        context.pushSuper(ChildProfileSummary());
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  Future<void> updateChildProfile({
    required BuildContext context,
    required String id,
  }) async {
    state = state.copyWith(isLoading: true);
    final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

    try {
      final response = await ChildProfileApi.updateChildProfile(
        authToken: authToken,
        request: UpdateChildProfileRequest(
          childId: id,
          name: state.nameController.text,
          dateOfBirth: state.dobController.text.toDateYMD,
          gender: state.gender,
          diagnoses: state.diagnosis.toStringList,
          allergies: state.allergiesController.text.toStringList,
          triggers: state.triggersController.text.toStringList,
          therapyGoals: state.therapyGoalsController.text.toStringList,
          dailyRoutine: state.childRoutine,
          tags: state.tags,
        ),
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
        await addToProfile(response.data ?? ChildData());
        context.pushSuper(ChildProfileSummary());
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  Future<void> deleteChildProfile({
    required BuildContext context,
    required String id,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

      final response = await ChildProfileApi.deleteChildProfile(
        authToken: authToken,
        request: DeleteChildProfileRequest(id: id),
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
        removeFromChildProfile(response.data ?? ChildData());
      }
    } on BaseError catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }
}
