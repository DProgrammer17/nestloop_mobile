import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_colors.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/constants/app_textsyles.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/bottom_nav/widgets/child_profiles_pending_dialog.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_model.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/child_profile_api.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/request/get_child_documents_request.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_levels.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/utils/extensions/widget_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dialogs/app_platform_date_picker.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/dialogs/app_platform_dialog.dart';

final profilesNotifier = NotifierProvider<ProfileNotifier, ProfileModel>(() {
  return ProfileNotifier();
});

class ProfileNotifier extends Notifier<ProfileModel> {
  @override
  ProfileModel build() => ProfileModel();

  void setUpTabController({
    required int length,
    required TickerProvider vsync,
  }) => state = state.copyWith(
    detailsTabController: TabController(length: length, vsync: vsync),
  );

  void updatePage(int page) => state = state.copyWith(currentTabPage: page);

  void updateTimeOption({
    required BuildContext context,
    required String time,
  }) async {
    state = state.copyWith(quickTimeSelection: time);
    switch (time) {
      case AppStrings.oneDay:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addDays(1),
        );
        return;

      case AppStrings.oneWeek:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addWeeks(1),
        );
        return;

      case AppStrings.oneMonth:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addMonths(1),
        );
        return;

      case AppStrings.threeMonth:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addMonths(3),
        );
        return;

      case AppStrings.sixMonth:
        state = state.copyWith(
          selectedTimeDuration: () => DateTime.now().addMonths(6),
        );
        return;

      case AppStrings.custom:
        final result = await showPlatformDatePicker(context);
        state = state.copyWith(selectedTimeDuration: () => result);
        return;
    }
  }

  void updateAccessType(AccessLevels accessType) {
    String type = '';
    if (accessType == AccessLevels.editAccess) {
      type = AppStrings.editAccess;
    }
    if (accessType == AccessLevels.viewAccess) {
      type = AppStrings.viewOnly;
    }
    if (accessType == AccessLevels.noAccess) {
      type = AppStrings.noAccess;
    }
    if (accessType == AccessLevels.none) {
      type = AppStrings.noAccess;
    }
    state = state.copyWith(selectedAccessType: type);
  }

  void selectorUpdateAccessType(String type) {
    switch (type) {
      case AppStrings.noAccess:
        state = state.copyWith(
          selectedType: type,
          selectedAccessType: AccessLevels.noAccess.jsonString,
        );
        return;

      case AppStrings.viewOnly:
        state = state.copyWith(
          selectedType: type,
          selectedAccessType: AccessLevels.viewAccess.jsonString,
        );
        return;

      case AppStrings.editAccess:
        state = state.copyWith(
          selectedType: type,
          selectedAccessType: AccessLevels.editAccess.jsonString,
        );
        return;
    }
  }

  void updateAccessDuration(AccessDurations duration) {
    state = state.copyWith(selectedAccessDuration: () => duration);
    if (duration == AccessDurations.expiry) {
      state = state.copyWith(showQuickTimeSelect: true);
    }
  }

  Future<void> getChildProfiles(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(
        ConfigStrings.authToken,
      );

      final response = await ChildProfileApi.getChildProfiles(
        authToken: authToken,
      );

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        state = state.copyWith(childProfiles: response.data ?? []);
        shuffleCareTeamList();

        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );

        Future.delayed(Duration(milliseconds: 800),(){
          if(response.data != null && response.data!.isEmpty){
            showChildProfilePendingDialog(context);
          }
        });
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

  void showChildProfilePendingDialog(BuildContext context) =>
      showPlatformActionDialog(
        context: context,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppStrings.childProfileEmpty,
              style: AppTextStyles.h3Inter(context),
            ),
            3.sbH,
            Text(
              AppStrings.childProfileEmptySubtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.body2RegularInter(
                context,
              ).copyWith(color: AppColors.slateCharcoal60),
            ),
          ],
        ),
        actions: [
              (context) => ChildProfilesPendingDialog(),
        ],
      );

  Future<void> getCareProviders({
    required BuildContext context,
    required String childProfileID,
  }) async {
    state = state.copyWith(isCareTeamLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(
        ConfigStrings.authToken,
      );

      final response = await ChildProfileApi.getChildCareProviders(
        authToken: authToken,
        request: GetChildDocsRequest(id: childProfileID),
      );

      state = state.copyWith(isCareTeamLoading: false);
      if (context.mounted) {
        state = state.copyWith(careTeam: response.data ?? []);
        shuffleCareTeamList();

        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
      }
    } on BaseError catch (e) {
      state = state.copyWith(isCareTeamLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(
          context: context,
          message: e.message.toString(),
        );
      }
    } catch (e) {
      state = state.copyWith(isCareTeamLoading: false);
      if (context.mounted) {
        AppMessages.showErrorMessage(context: context, message: e.toString());
      }
    }
    return;
  }

  void shuffleCareTeamList() {
    List<ChildCareProviderResponse> interimList = state.careTeam.toList();
    if (interimList.any((e) => (e.careProvider?.isParent ?? false))) {
      final List<ChildCareProviderResponse> parents = interimList
          .where((e) => (e.careProvider?.isParent ?? false))
          .toList();
      interimList = interimList.toList()
        ..removeWhere((e) => (e.careProvider?.isParent ?? false));
      interimList = interimList.toList()..insertAll(0, parents);
      state = state.copyWith(careTeam: interimList.toList());
    }
  }
}
