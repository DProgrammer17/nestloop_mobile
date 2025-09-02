import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_strings.dart';
import 'package:nest_loop_mobile/core/services/app_storage.dart';
import 'package:nest_loop_mobile/features/home/state/home_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_marketplace_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_message_model.dart';
import 'package:nest_loop_mobile/features/home/state/interim_task_activity_model.dart';
import 'package:nest_loop_mobile/network/api/base/base_error.dart';
import 'package:nest_loop_mobile/network/api/user/response/get_user_profile_response.dart';
import 'package:nest_loop_mobile/network/api/user/user_api.dart';
import 'package:nest_loop_mobile/utils/extensions/date_extensions.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/app_toast.dart';

final homeNotifier = NotifierProvider<HomeNotifier, HomeModel>(() {
  return HomeNotifier();
});

class HomeNotifier extends Notifier<HomeModel> {
  @override
  HomeModel build() => HomeModel(
    searchMessagesController: TextEditingController(),
    taskUpdates: [
      TaskNotification(
        id: "1",
        time: DateTime(2025, 8, 26, 9, 0),
        message: "Task 'Speech Therapy' completed by Sarah Thompson.",
      ),
      TaskNotification(
        id: "2",
        time: DateTime(2025, 8, 26, 10, 30),
        message: "Task 'Math Homework Assistance' completed by John Doe.",
      ),
      TaskNotification(
        id: "3",
        time: DateTime(2025, 8, 26, 11, 15),
        message: "Task 'Reading Session' completed by Jane Smith.",
      ),
      TaskNotification(
        id: "4",
        time: DateTime(2025, 8, 26, 13, 0),
        message: "Task 'Physical Therapy' completed by Michael Brown.",
      ),
      TaskNotification(
        id: "5",
        time: DateTime(2025, 8, 26, 14, 20),
        message: "Task 'Music Practice' completed by Emily Johnson.",
      ),
      TaskNotification(
        id: "6",
        time: DateTime(2025, 8, 26, 15, 45),
        message: "Task 'Art Class' completed by Daniel Wilson.",
      ),
    ],
    messageUpdates: [
      InterimMessageModel(
        id: "1",
        sender: "Marcus Rogers",
        url: "https://example.com/avatar1.png",
        lastMessage: "Need to discuss Elijah's school plan...",
        time: DateTime.now().subtract(Duration(minutes: 5)),
        unreadCount: 5,
        pinned: true,
      ),
      InterimMessageModel(
        id: "2",
        sender: "Sarah Thompson",
        url: "https://example.com/avatar2.png",
        lastMessage: "I'll send you the report by tonight.",
        time: DateTime.now().subtract(Duration(hours: 1)),
        unreadCount: 2,
      ),
      InterimMessageModel(
        id: "3",
        sender: "David Johnson",
        url: "https://example.com/avatar3.png",
        lastMessage: "Meeting has been rescheduled to tomorrow.",
        time: DateTime.now().subtract(Duration(hours: 3)),
        unreadCount: 0,
      ),
      InterimMessageModel(
        id: "4",
        sender: "Linda Evans",
        url: "https://example.com/avatar4.png",
        lastMessage: "Happy Birthday 🎉 Hope you enjoy your day!",
        time: DateTime.now().subtract(Duration(days: 1)),
        unreadCount: 0,
      ),
      InterimMessageModel(
        id: "5",
        sender: "Tom Walker",
        url: "https://example.com/avatar5.png",
        lastMessage: "Can you review the proposal draft?",
        time: DateTime.now().subtract(Duration(days: 2, hours: 4)),
        unreadCount: 3,
      ),
      InterimMessageModel(
        id: "6",
        sender: "Sophia Carter",
        url: "https://example.com/avatar6.png",
        lastMessage: "Thanks for your help yesterday!",
        time: DateTime.now().subtract(Duration(days: 3)),
        unreadCount: 0,
        pinned: true,
      ),
      InterimMessageModel(
        id: "7",
        sender: "Parent Group",
        url: "https://example.com/group.png",
        lastMessage: "Reminder: PTA meeting on Friday.",
        time: DateTime.now().subtract(Duration(days: 4, hours: 2)),
        unreadCount: 10,
      ),
    ],
    communityUpdates: [
      CommunityPostNotification(
        time: DateTime.now().subtract(const Duration(hours: 1)),
        posts: [
          CommunityPost(
            id: "post_001",
            time: DateTime.now().subtract(const Duration(hours: 1)),
            forum: Forum(
              name: "Health and Fitness",
              url: "https://example.com/forums/health",
            ),
            topic: "Anxiety",
            author: Author(
              name: "Laura Sanchez",
              avatarUrl: "https://example.com/avatars/laura.png",
              postTime: DateTime.now().subtract(const Duration(hours: 1)),
            ),
            content: PostContent(
              text:
                  "Had a rough day today, trying to deal with my son’s anxiety. Does anyone have tips for managing panic attacks when they happen?",
            ),
            reactions: [
              PostReactions(
                reaction: "heart",
                sender: "Marcus Rogers",
                avatarUrl: "https://example.com/avatars/marcus.png",
              ),
              PostReactions(
                reaction: "clap",
                sender: "Sophia Lee",
                avatarUrl: "https://example.com/avatars/sophia.png",
              ),
              PostReactions(
                reaction: "comment",
                sender: "David Kim",
                avatarUrl: "https://example.com/avatars/david.png",
              ),
            ],
            type: "POST",
            read: false,
          ),
        ],
      ),

      CommunityPostNotification(
        time: DateTime.now().subtract(const Duration(hours: 3)),
        posts: [
          CommunityPost(
            id: "post_002",
            time: DateTime.now().subtract(const Duration(hours: 3)),
            forum: Forum(
              name: "Parenting",
              url: "https://example.com/forums/parenting",
            ),
            topic: "Sleep Training",
            author: Author(
              name: "Michael Johnson",
              avatarUrl: "https://example.com/avatars/michael.png",
              postTime: DateTime.now().subtract(const Duration(hours: 3)),
            ),
            content: PostContent(
              text:
                  "Has anyone tried gentle sleep training methods? Looking for something that worked for your toddlers.",
            ),
            reactions: [
              PostReactions(
                reaction: "clap",
                sender: "Sarah Parker",
                avatarUrl: "https://example.com/avatars/sarah.png",
              ),
            ],
            type: "POST",
            read: true,
          ),
          CommunityPost(
            id: "post_003",
            time: DateTime.now().subtract(
              const Duration(hours: 3, minutes: 20),
            ),
            forum: Forum(
              name: "Parenting",
              url: "https://example.com/forums/parenting",
            ),
            topic: "Sleep Training",
            author: Author(
              name: "Emily Davis",
              avatarUrl: "https://example.com/avatars/emily.png",
              postTime: DateTime.now().subtract(
                const Duration(hours: 3, minutes: 20),
              ),
            ),
            content: PostContent(
              text:
                  "We used a consistent bedtime routine and white noise machine. Took about 2 weeks but worked really well.",
            ),
            reactions: [],
            type: "COMMENT",
            read: true,
          ),
        ],
      ),
    ],
    marketPlaceUpdates: [
      MarketplaceNotification(
        id: "1",
        title: "Portable AAC Communication Device",
        price: 12.00,
        currency: "GBP",
        imageUrl: "https://example.com/images/aac_device.jpg",
        status: "Sent",
        deliveryMethod: "Pickup",
        paid: false,
      ),
      MarketplaceNotification(
        id: "2",
        title: "Wireless Bluetooth Headphones",
        price: 45.50,
        currency: "USD",
        imageUrl: "https://example.com/images/headphones.jpg",
        status: "Accepted",
        deliveryMethod: "Delivery",
        paid: true,
      ),
      MarketplaceNotification(
        id: "3",
        title: "Rechargeable Desk Lamp",
        price: 8.75,
        currency: "GBP",
        imageUrl: "https://example.com/images/lamp.jpg",
        status: "Pending",
        deliveryMethod: "Pickup",
        paid: false,
      ),
      MarketplaceNotification(
        id: "4",
        title: "POS Terminal Device",
        price: 120000.00,
        currency: "NGN",
        imageUrl: "https://example.com/images/pos.jpg",
        status: "Sent",
        deliveryMethod: "Delivery",
        paid: true,
      ),
      MarketplaceNotification(
        id: "5",
        title: "E-Book Reader",
        price: 60.00,
        currency: "USD",
        imageUrl: "https://example.com/images/ebook_reader.jpg",
        status: "Accepted",
        deliveryMethod: "Pickup",
        paid: false,
      ),
    ],
  );

  void updatePage(int page) => state = state.copyWith(currentPage: page);
  void homeUpdatePage(int page) =>
      state = state.copyWith(updatesCurrentPage: page);
  void updateOffers(String type) => state = state.copyWith(offersTypes: type);
  void updateChild(ChildData child) =>
      state = state.copyWith(selectedChild: () => child);

  Future<void> getUserData(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final authToken = await AppStorage.getStringPref(ConfigStrings.authToken);

      final response = await UserApi.getUserData(authToken: authToken);

      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        state = state.copyWith(userResponse: () => response.data);

        AppMessages.showSuccessMessage(
          context: context,
          message: response.message ?? AppStrings.success,
        );
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

  void setFilterDate({bool now = false, bool add = false, bool minus = false}) {
    ///Set current date as the filter option
    if (now) {
      state = state.copyWith(currentFilter: DateTime.now);
      return;
    }

    DateTime editTime = state.currentFilter ?? DateTime.now();

    ///Add to the date based on the filter option
    if (add) {
      editTime = editTime.addMonths(1);
    }

    ///Minus to the date based on the filter option
    if (minus) {
      editTime = editTime.subtractMonths(1);
    }
    state = state.copyWith(currentFilter: () => editTime);
    return;
  }

  List<CommunityPostNotification> returnSortedList() {
    Map<String, List<CommunityPost>> groupedByDate = {};

    ///Store the date here for the communityInfoPost list. Using DateTime as a key causes issues.
    Map<String, DateTime> dateKeyToTime = {};

    for (var updates in state.communityUpdates) {
      final dateKey = updates.time;
      final comparisonDate = dateKey.toHuman12HourFormat().split(',').first;
      if (!groupedByDate.containsKey(comparisonDate)) {
        ///Create the maps
        groupedByDate[comparisonDate] = [];
        dateKeyToTime[comparisonDate] = dateKey;
      }

      ///add posts to that date
      for (var post in updates.posts) {
        final postDate = post.time.toHuman12HourFormat().split(',').first;
        if (comparisonDate == postDate) {
          groupedByDate[comparisonDate]!.add(post);
        }
      }
    }

    /// Convert back to CommunityPostNotification list
    return groupedByDate.entries.map((entry) {
      return CommunityPostNotification(
        time: dateKeyToTime[entry.key]!, // Use stored DateTime
        posts: entry.value,
      );
    }).toList();
  }
}
