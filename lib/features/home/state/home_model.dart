import 'package:flutter/cupertino.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_marketplace_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_message_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_task_activity_model.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';

class HomeModel {
  final bool isLoading;
  final int currentPage;
  final int updatesCurrentPage;
  final TextEditingController searchMessagesController;
  final String offersTypes;
  final ChildData? selectedChild;
  final HomeData? userResponse;
  final DateTime? currentFilter;
  final List<TaskNotification> taskUpdates;
  final List<InterimMessageModel> messageUpdates;
  final List<CommunityPostNotification> communityUpdates;
  final List<MarketplaceNotification> marketPlaceUpdates;

  const HomeModel({
    required this.searchMessagesController,
    this.isLoading = false,
    this.currentPage = 0,
    this.updatesCurrentPage = 0,
    this.userResponse,
    this.selectedChild,
    this.currentFilter,
    this.offersTypes = AppStrings.sent,
    this.taskUpdates = const [],
    this.messageUpdates = const [],
    this.communityUpdates = const [],
    this.marketPlaceUpdates = const [],
  });

  HomeModel copyWith({
    bool? isLoading,
    int? currentPage,
    int? updatesCurrentPage,
    String? offersTypes,
    TextEditingController? searchMessagesController,
    DateTime? Function()? currentFilter,
    HomeData? Function()? userResponse,
    ChildData? Function()? selectedChild,
    List<TaskNotification>? taskUpdates,
    List<InterimMessageModel>? messageUpdates,
    List<CommunityPostNotification>? communityUpdates,
    List<MarketplaceNotification>? marketPlaceUpdates,
  }) {
    return HomeModel(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      updatesCurrentPage: updatesCurrentPage ?? this.updatesCurrentPage,
      offersTypes: offersTypes ?? this.offersTypes,
      taskUpdates: taskUpdates ?? this.taskUpdates,
      messageUpdates: messageUpdates ?? this.messageUpdates,
      communityUpdates: communityUpdates ?? this.communityUpdates,
      marketPlaceUpdates: marketPlaceUpdates ?? this.marketPlaceUpdates,
      searchMessagesController:
          searchMessagesController ?? this.searchMessagesController,
      currentFilter: currentFilter != null
          ? currentFilter()
          : this.currentFilter,
      userResponse: userResponse != null ? userResponse() : this.userResponse,
      selectedChild: selectedChild != null
          ? selectedChild()
          : this.selectedChild,
    );
  }
}
