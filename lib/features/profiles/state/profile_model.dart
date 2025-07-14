import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/network/api/child_profiles/response/get_child_care_provider_response.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/net_utils/enums/access_durations.dart';

class ProfileModel {
  final TabController? detailsTabController;
  final int currentTabPage;
  final List<ChildData> childProfiles;
  final List<ChildCareProviderResponse> careTeam;
  final List<String> accessTypes;
  final List<String> timeOptions;
  final String selectedAccessType;
  final String selectedType;
  final AccessDurations? selectedAccessDuration;
  final String quickTimeSelection;
  final DateTime? selectedTimeDuration;
  final bool showQuickTimeSelect;
  final bool isLoading;
  final bool isCareTeamLoading;

  const ProfileModel({
    this.detailsTabController,
    this.currentTabPage = 0,
    this.childProfiles = const [],
    this.careTeam = const [],
    this.timeOptions = const [
      AppStrings.oneDay,
      AppStrings.oneWeek,
      AppStrings.oneMonth,
      AppStrings.threeMonth,
      AppStrings.sixMonth,
    ],
    this.accessTypes = const [
      AppStrings.noAccess,
      AppStrings.viewOnly,
      AppStrings.editAccess,
    ],
    this.selectedAccessType = '',
    this.selectedType = '',
    this.selectedAccessDuration,
    this.selectedTimeDuration,
    this.quickTimeSelection = '',
    this.showQuickTimeSelect = false,
    this.isLoading = false,
    this.isCareTeamLoading = false,
  });

  ProfileModel copyWith({
    TabController? detailsTabController,
    int? currentTabPage,
    List<ChildData>? childProfiles,
    List<ChildCareProviderResponse>? careTeam,
    List<String>? timeOptions,
    List<String>? accessTypes,
    String? selectedAccessType,
    String? selectedType,
    AccessDurations? Function()? selectedAccessDuration,
    DateTime? Function()? selectedTimeDuration,
    String? quickTimeSelection,
    bool? showQuickTimeSelect,
    bool? isLoading,
    bool? isCareTeamLoading,
  }) {
    return ProfileModel(
      detailsTabController: detailsTabController ?? this.detailsTabController,
      currentTabPage: currentTabPage ?? this.currentTabPage,
      childProfiles: childProfiles ?? this.childProfiles,
      careTeam: careTeam ?? this.careTeam,
      timeOptions: timeOptions ?? this.timeOptions,
      accessTypes: accessTypes ?? this.accessTypes,
      isLoading: isLoading ?? this.isLoading,
      isCareTeamLoading: isCareTeamLoading ?? this.isCareTeamLoading,
      selectedAccessType: selectedAccessType ?? this.selectedAccessType,
      selectedType: selectedType ?? this.selectedType,
      showQuickTimeSelect: showQuickTimeSelect ?? this.showQuickTimeSelect,
      quickTimeSelection: quickTimeSelection ?? this.quickTimeSelection,
      selectedAccessDuration: selectedAccessDuration != null
          ? selectedAccessDuration()
          : this.selectedAccessDuration,
      selectedTimeDuration: selectedTimeDuration != null
          ? selectedTimeDuration()
          : this.selectedTimeDuration,
    );
  }
}
