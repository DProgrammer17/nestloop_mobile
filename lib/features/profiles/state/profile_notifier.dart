import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/profiles/state/parent_model.dart';
import 'package:nest_loop_mobile/features/profiles/state/profile_model.dart';
import 'package:nest_loop_mobile/utils/enums/access_duration.dart';
import 'package:nest_loop_mobile/utils/enums/access_level.dart';

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

  void updateTimeOption(String time) => state = state.copyWith(quickTimeSelection: time);

  void updateAccessType(AccessLevel accessType) {
    String type = '';
    if (accessType == AccessLevel.edit) {
      type = AppStrings.editAccess;
    }
    if (accessType == AccessLevel.view) {
      type = AppStrings.viewOnly;
    }
    if (accessType == AccessLevel.none) {
      type = AppStrings.noAccess;
    }
    state = state.copyWith(selectedAccessType: type);
  }

  void updateAccessDuration(AccessDuration duration) {
    state = state.copyWith(selectedAccessDuration: () => duration);
    if (duration == AccessDuration.timeLimited) {
      state = state.copyWith(showQuickTimeSelect: true);
    }
  }

  void updateCareTeamList() {
    state = state.copyWith(
      careTeam: [
        CareTeamModel(
          profile: '',
          name: 'Patel Indogrim',
          email: 'patel@patelo.com',
          accessLevel: AccessLevel.limitedEdit,
          accessDuration: AccessDuration.ongoing,
        ),
        CareTeamModel(
          profile: '',
          name: 'Accaccia Vernon',
          email: 'vernon@patelo.com',
          accessLevel: AccessLevel.view,
          accessDuration: AccessDuration.ongoing,
        ),
        CareTeamModel(
          profile: '',
          name: 'Violet Peragrin',
          email: 'peragrin@patelo.com',
          isParent: true,
          accessLevel: AccessLevel.edit,
          accessDuration: AccessDuration.permanent,
        ),
        CareTeamModel(
          profile: '',
          name: 'Willow Vernon',
          email: 'willow@patelo.com',
          accessLevel: AccessLevel.limitedEdit,
          accessDuration: AccessDuration.timeLimited,
          start: DateTime(2024, 6, 22),
          ends: DateTime(2025, 11, 22),
        ),
      ],
    );
    shuffleCareTeamList();
  }

  void shuffleCareTeamList() {
    List<CareTeamModel> interimList = state.careTeam.toList();
    if (interimList.any((e) => e.isParent)) {
      final List<CareTeamModel> parents = interimList
          .where((e) => e.isParent)
          .toList();
      interimList = interimList.toList()..removeWhere((e) => e.isParent);
      interimList = interimList.toList()..insertAll(0, parents);
      state = state.copyWith(careTeam: interimList.toList());
    }
  }
}
