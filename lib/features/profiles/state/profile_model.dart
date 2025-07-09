import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/profiles/state/parent_model.dart';
import 'package:nest_loop_mobile/utils/enums/access_duration.dart';
import 'package:nest_loop_mobile/utils/enums/access_level.dart';

class ProfileModel {
  final TabController? detailsTabController;
  final int currentTabPage;
  final List<CareTeamModel> careTeam;
  final List<String> accessTypes;
  final List<String> timeOptions;
  final String selectedAccessType;
  final AccessDuration? selectedAccessDuration;
  final String quickTimeSelection;
  final bool showQuickTimeSelect;

  const ProfileModel({
    this.detailsTabController,
    this.currentTabPage = 0,
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
    this.selectedAccessDuration,
    this.quickTimeSelection = '',
    this.showQuickTimeSelect = false,
  });

  ProfileModel copyWith({
    TabController? detailsTabController,
    int? currentTabPage,
    List<CareTeamModel>? careTeam,
    List<String>? timeOptions,
    List<String>? accessTypes,
    String? selectedAccessType,
    AccessDuration? Function()? selectedAccessDuration,
    String? quickTimeSelection,
    bool? showQuickTimeSelect,
  }) {
    return ProfileModel(
      detailsTabController: detailsTabController ?? this.detailsTabController,
      currentTabPage: currentTabPage ?? this.currentTabPage,
      careTeam: careTeam ?? this.careTeam,
      timeOptions: timeOptions ?? this.timeOptions,
      accessTypes: accessTypes ?? this.accessTypes,
      selectedAccessType: selectedAccessType ?? this.selectedAccessType,
      showQuickTimeSelect: showQuickTimeSelect ?? this.showQuickTimeSelect,
      quickTimeSelection: quickTimeSelection ?? this.quickTimeSelection,
      selectedAccessDuration: selectedAccessDuration != null
          ? selectedAccessDuration()
          : this.selectedAccessDuration,
    );
  }
}
