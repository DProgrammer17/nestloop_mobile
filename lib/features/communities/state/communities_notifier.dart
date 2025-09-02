import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nest_loop_mobile/core/constants/app_constants.dart';
import 'package:nest_loop_mobile/features/communities/state/communities_vm.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_forum_model.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_post_model.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_sos_member_model.dart';
import 'package:nest_loop_mobile/features/communities/ui/replies_pages.dart';
import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';
import 'package:nest_loop_mobile/widgets/utility_widgets/modals/app_platform_bottom_sheet.dart';

final communitiesNotifier =
    NotifierProvider<CommunitiesNotifier, CommunitiesVM>(() {
      return CommunitiesNotifier();
    });

class CommunitiesNotifier extends Notifier<CommunitiesVM> {
  @override
  CommunitiesVM build() => CommunitiesVM(
    forumList: [
      GroupInfo(
        id: "1",
        name: "Health & Wellness",
        description:
            "Discuss healthy habits, exercise routines, and wellness tips.",
        iconUrl: "assets/icons/health.png",
        membersCount: 5600,
        newPostsCount: 42,
        isJoined: false,
      ),
      GroupInfo(
        id: "2",
        name: "Tech Enthusiasts",
        description:
            "Stay updated with the latest in technology, gadgets, and coding.",
        iconUrl: "assets/icons/tech.png",
        membersCount: 12400,
        newPostsCount: 120,
        isJoined: true,
      ),
      GroupInfo(
        id: "3",
        name: "Book Lovers",
        description: "Share and discuss your favorite books and authors.",
        iconUrl: "assets/icons/books.png",
        membersCount: 8300,
        newPostsCount: 15,
        isJoined: false,
      ),
      GroupInfo(
        id: "4",
        name: "Fitness Freaks",
        description: "Workouts, diets, and motivation to stay in shape.",
        iconUrl: "assets/icons/fitness.png",
        membersCount: 9800,
        newPostsCount: 67,
        isJoined: true,
      ),
      GroupInfo(
        id: "5",
        name: "Foodies Hub",
        description: "Discover recipes, share food pics, and explore cuisines.",
        iconUrl: "assets/icons/food.png",
        membersCount: 15400,
        newPostsCount: 88,
        isJoined: false,
      ),
      GroupInfo(
        id: "6",
        name: "Travel & Adventure",
        description: "Travel tips, experiences, and destination guides.",
        iconUrl: "assets/icons/travel.png",
        membersCount: 7600,
        newPostsCount: 34,
        isJoined: true,
      ),
      GroupInfo(
        id: "7",
        name: "Music Vibes",
        description: "Talk about your favorite genres, artists, and playlists.",
        iconUrl: "assets/icons/music.png",
        membersCount: 13200,
        newPostsCount: 52,
        isJoined: false,
      ),
      GroupInfo(
        id: "8",
        name: "Movie Buffs",
        description: "Discuss movies, reviews, and upcoming releases.",
        iconUrl: "assets/icons/movies.png",
        membersCount: 9100,
        newPostsCount: 21,
        isJoined: false,
      ),
      GroupInfo(
        id: "9",
        name: "Startup Founders",
        description: "Networking and sharing ideas for entrepreneurs.",
        iconUrl: "assets/icons/startup.png",
        membersCount: 4400,
        newPostsCount: 12,
        isJoined: true,
      ),
      GroupInfo(
        id: "10",
        name: "Parenting Tips",
        description: "Advice and stories for parents raising kids.",
        iconUrl: "assets/icons/parenting.png",
        membersCount: 5000,
        newPostsCount: 27,
        isJoined: false,
      ),
    ],
    posts: [
      InterimPostModel(
        id: "post_001",
        topic: "Anxiety",
        author: Author(
          name: "Jennifer Miller",
          avatarUrl: "https://example.com/avatars/jennifer.jpg",
          postTime: DateTime.now().subtract(const Duration(hours: 1)),
        ),
        content:
            "Had a rough day today, trying to deal with my son’s anxiety. Does anyone have tips for managing panic attacks when they happen? It’s been getting more frequent lately.",
        views: 200,
        reactions: [
          PostReactions(
            reaction: "heart",
            sender: "Michael Lee",
            avatarUrl: "https://example.com/avatars/michael.jpg",
          ),
          PostReactions(
            reaction: "clap",
            sender: "Sarah Kim",
            avatarUrl: "https://example.com/avatars/sarah.jpg",
          ),
          PostReactions(
            reaction: "lightbulb",
            sender: "David Johnson",
            avatarUrl: "https://example.com/avatars/david.jpg",
          ),
        ],
        replies: [
          RepliesData(
            senderId: "user_002",
            sender: "Michael Lee",
            url: "https://example.com/avatars/michael.jpg",
            messageId: "msg_001",
            message: "I recommend grounding exercises; they help me a lot.",
            postTime: DateTime.now().subtract(const Duration(minutes: 45)),
            views: 18,
          ),
          RepliesData(
            senderId: "user_003",
            sender: "Sarah Kim",
            url: "https://example.com/avatars/sarah.jpg",
            messageId: "msg_002",
            message: "Deep breathing apps are great for panic attacks.",
            postTime: DateTime.now().subtract(const Duration(minutes: 30)),
            views: 25,
          ),
          RepliesData(
            senderId: "user_003",
            sender: "Sarah Kim",
            url: "https://example.com/avatars/sarah.jpg",
            messageId: "msg_002",
            message: "Deep breathing apps are great for panic attacks.",
            postTime: DateTime.now().subtract(const Duration(minutes: 30)),
            views: 25,
          ),
        ],
      ),
      InterimPostModel(
        id: "post_002",
        topic: "Work Stress",
        author: Author(
          name: "David Johnson",
          avatarUrl: "https://example.com/avatars/david.jpg",
          postTime: DateTime.now().subtract(const Duration(hours: 3)),
        ),
        content:
            "Feeling really burned out at work lately. How do you guys maintain work-life balance?",
        views: 23,
        reactions: [
          PostReactions(
            reaction: "heart",
            sender: "Emily Davis",
            avatarUrl: "https://example.com/avatars/emily.jpg",
          ),
          PostReactions(
            reaction: "comment",
            sender: "Chris Evans",
            avatarUrl: "https://example.com/avatars/chris.jpg",
          ),
        ],
        replies: [
          RepliesData(
            senderId: "user_005",
            sender: "Emily Davis",
            url: "https://example.com/avatars/emily.jpg",
            messageId: "msg_003",
            message: "Try setting boundaries like no emails after 6pm.",
            postTime: DateTime.now().subtract(
              const Duration(hours: 2, minutes: 30),
            ),
            views: 42,
          ),
        ],
      ),
      InterimPostModel(
        id: "post_003",
        topic: "Meditation",
        author: Author(
          name: "Sophia Brown",
          avatarUrl: "https://example.com/avatars/sophia.jpg",
          postTime: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        ),
        content:
            "I’ve been experimenting with morning meditation. Anyone else feel it helps their focus?",
        views: 145,
        reactions: [
          PostReactions(
            reaction: "clap",
            sender: "Chris Evans",
            avatarUrl: "https://example.com/avatars/chris.jpg",
          ),
          PostReactions(
            reaction: "heart",
            sender: "Michael Lee",
            avatarUrl: "https://example.com/avatars/michael.jpg",
          ),
        ],
        replies: [
          RepliesData(
            senderId: "user_007",
            sender: "Chris Evans",
            url: "https://example.com/avatars/chris.jpg",
            messageId: "msg_004",
            message: "Yes! I do 10 minutes daily and it’s life-changing.",
            postTime: DateTime.now().subtract(
              const Duration(days: 1, hours: 1),
            ),
            views: 67,
          ),
          RepliesData(
            senderId: "user_008",
            sender: "Emma Wilson",
            url: "https://example.com/avatars/emma.jpg",
            messageId: "msg_005",
            message: "Meditation also helps me sleep better.",
            postTime: DateTime.now().subtract(const Duration(days: 1)),
            views: 54,
          ),
        ],
      ),
    ],
    replyPosts: [
      ReplyPostModel(
        id: "post_001",
        topic: "Mental Health",
        post: "Let's talk about ways to manage stress in daily life.",
        views: 120,
        replyPosts: [
          InterimPostModel(
            id: "p1",
            topic: "Anxiety",
            author: Author(
              name: "Alice Johnson",
              avatarUrl: "https://example.com/avatars/alice.jpg",
              postTime: DateTime.now().subtract(const Duration(hours: 2)),
            ),
            content: "I usually go for evening walks to calm my mind.",
            views: 56,
            reactions: [
              PostReactions(
                reaction: "hearts",
                sender: "Bob",
                avatarUrl: "https://example.com/avatars/bob.png",
              ),
              PostReactions(
                reaction: "claps",
                sender: "Chris",
                avatarUrl: "https://example.com/avatars/chris.png",
              ),
            ],
            replies: [
              RepliesData(
                senderId: "u2",
                sender: "David",
                url: "https://example.com/avatars/david.png",
                messageId: "m1",
                message: "Walking helps me too, especially with music!",
                postTime: DateTime.now().subtract(const Duration(hours: 1)),
                views: 22,
              ),
            ],
          ),
          InterimPostModel(
            id: "p2",
            topic: "Mindfulness",
            author: Author(
              name: "Sarah Lee",
              avatarUrl: "https://example.com/avatars/sarah.png",
              postTime: DateTime.now().subtract(const Duration(days: 1)),
            ),
            content: "Practicing meditation for 10 mins daily really helps.",
            views: 74,
            reactions: [
              PostReactions(
                reaction: "hearts",
                sender: "Emma",
                avatarUrl: "https://example.com/avatars/emma.png",
              ),
              PostReactions(
                reaction: "comments",
                sender: "Jade",
                avatarUrl: "https://example.com/avatars/jade.png",
              ),
            ],
            replies: [
              RepliesData(
                senderId: "u3",
                sender: "Tom",
                url: "https://example.com/avatars/tom.png",
                messageId: "m2",
                message: "I agree! I use Headspace to stay consistent.",
                postTime: DateTime.now().subtract(const Duration(hours: 3)),
                views: 15,
              ),
              RepliesData(
                senderId: "u4",
                sender: "Jade",
                url: "https://example.com/avatars/jade.png",
                messageId: "m3",
                message: "Consistency is key, thanks for the reminder.",
                postTime: DateTime.now().subtract(const Duration(minutes: 45)),
                views: 10,
              ),
            ],
          ),
        ],
      ),
      ReplyPostModel(
        id: "post_002",
        topic: "Productivity",
        post:
            "What are your best hacks for staying productive while working remotely?",
        views: 85,
        replyPosts: [
          InterimPostModel(
            id: "p3",
            topic: "Focus",
            author: Author(
              name: "James Carter",
              avatarUrl: "https://example.com/avatars/james.png",
              postTime: DateTime.now().subtract(const Duration(hours: 5)),
            ),
            content: "I use the Pomodoro technique. Works like magic!",
            views: 40,
            reactions: [
              PostReactions(
                reaction: "claps",
                sender: "Sophia",
                avatarUrl: "https://example.com/avatars/sophia.png",
              ),
            ],
            replies: [
              RepliesData(
                senderId: "u5",
                sender: "Lucas",
                url: "https://example.com/avatars/lucas.png",
                messageId: "m4",
                message: "Same here, 25 min focus + 5 min break works wonders.",
                postTime: DateTime.now().subtract(const Duration(hours: 2)),
                views: 8,
              ),
            ],
          ),
          InterimPostModel(
            id: "p4",
            topic: "Work-Life Balance",
            author: Author(
              name: "Maria Gomez",
              avatarUrl: "https://example.com/avatars/maria.png",
              postTime: DateTime.now().subtract(const Duration(hours: 6)),
            ),
            content: "I log off completely after 6 pm. Keeps me sane.",
            views: 33,
            reactions: [
              PostReactions(
                reaction: "hearts",
                sender: "Nina",
                avatarUrl: "https://example.com/avatars/nina.png",
              ),
            ],
            replies: [],
          ),
        ],
      ),
      ReplyPostModel(
        id: "post_003",
        topic: "Fitness",
        post: "How do you stay active while working a desk job?",
        views: 143,
        replyPosts: [
          InterimPostModel(
            id: "p5",
            topic: "Stretching",
            author: Author(
              name: "Kevin Wu",
              avatarUrl: "https://example.com/avatars/kevin.png",
              postTime: DateTime.now().subtract(const Duration(days: 2)),
            ),
            content: "I set reminders every hour to stretch and move.",
            views: 65,
            reactions: [
              PostReactions(
                reaction: "claps",
                sender: "Daisy",
                avatarUrl: "https://example.com/avatars/daisy.png",
              ),
            ],
            replies: [
              RepliesData(
                senderId: "u6",
                sender: "Oliver",
                url: "https://example.com/avatars/oliver.png",
                messageId: "m5",
                message: "Great tip, I’ll start doing that.",
                postTime: DateTime.now().subtract(const Duration(hours: 20)),
                views: 12,
              ),
            ],
          ),
          InterimPostModel(
            id: "p6",
            topic: "At-home workouts",
            author: Author(
              name: "Priya Singh",
              avatarUrl: "https://example.com/avatars/priya.png",
              postTime: DateTime.now().subtract(
                const Duration(days: 1, hours: 3),
              ),
            ),
            content: "I follow 15-minute HIIT YouTube videos daily.",
            views: 78,
            reactions: [
              PostReactions(
                reaction: "hearts",
                sender: "Ryan",
                avatarUrl: "https://example.com/avatars/ryan.png",
              ),
              PostReactions(
                reaction: "comments",
                sender: "Ella",
                avatarUrl: "https://example.com/avatars/ella.png",
              ),
            ],
            replies: [
              RepliesData(
                senderId: "u7",
                sender: "Ella",
                url: "https://example.com/avatars/ella.png",
                messageId: "m6",
                message: "Do you have a link to your favorite channel?",
                postTime: DateTime.now().subtract(const Duration(hours: 7)),
                views: 18,
              ),
            ],
          ),
        ],
      ),
    ],
    sosMembers: [
      InterimSosMemberModel(
        fullName: "Dr. Jane Okafor",
        role: "Psychologist",
        avatarUrl: "https://example.com/avatars/jane_okafor.png",
      ),
      InterimSosMemberModel(
        fullName: "Michael Adeyemi",
        role: "Community Moderator",
        avatarUrl: "https://example.com/avatars/michael_adeyemi.png",
      ),
      InterimSosMemberModel(
        fullName: "Sarah Johnson",
        role: "Peer Support",
        avatarUrl: "https://example.com/avatars/sarah_johnson.png",
      ),
      InterimSosMemberModel(
        fullName: "Dr. Chinedu Nwosu",
        role: "Therapist",
        avatarUrl: "https://example.com/avatars/chinedu_nwosu.png",
      ),
      InterimSosMemberModel(
        fullName: "Emily Chen",
        role: "Mental Health Advocate",
        avatarUrl: "https://example.com/avatars/emily_chen.png",
      ),
      InterimSosMemberModel(
        fullName: "David Wright",
        role: "Crisis Counselor",
        avatarUrl: "https://example.com/avatars/david_wright.png",
      ),
      InterimSosMemberModel(
        fullName: "Fatima Bello",
        role: "Community Volunteer",
        avatarUrl: "https://example.com/avatars/fatima_bello.png",
      ),
      InterimSosMemberModel(
        fullName: "John Smith",
        role: "Emergency Contact",
        avatarUrl: "https://example.com/avatars/john_smith.png",
      ),
    ],
  );

  void updatePage(int page) => state = state.copyWith(currentPage: page);

  void setUpTabController({
    required int length,
    required TickerProvider vsync,
  }) => state = state.copyWith(
    communitiesTabController: TabController(length: length, vsync: vsync),
  );

  void showRepliesModal({
    required BuildContext context,
    required String postId,
  }) async {
    ///Open replies bottom sheet
    return AppPlatformBottomSheet.showAppBottomModalSheet(
      context: context,
      axisSize: MainAxisSize.max,
      enableDrag: false,
      borderRadius: 0,
      content: (context) =>
          RepliesPage(post: state.replyPosts.firstWhere((e) => e.id == postId)),
    );
  }
}
