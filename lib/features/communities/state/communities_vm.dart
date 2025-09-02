import 'package:flutter/material.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_forum_model.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_post_model.dart';
import 'package:nest_loop_mobile/features/communities/state/interim_sos_member_model.dart';

class CommunitiesVM {
  final bool isLoading;
  final int currentPage;
  final TabController? communitiesTabController;
  final TextEditingController? replyController;
  final List<GroupInfo> forumList;
  final List<InterimPostModel> posts;
  final List<ReplyPostModel> replyPosts;
  final List<InterimSosMemberModel> sosMembers;

  const CommunitiesVM({
    this.communitiesTabController,
    this.replyController,
    this.isLoading = false,
    this.currentPage = 0,
    this.forumList = const[],
    this.posts = const[],
    this.replyPosts = const[],
    this.sosMembers = const[],
});

  CommunitiesVM copyWith({
    bool? isLoading,
    int? currentPage,
    TabController? communitiesTabController,
    TextEditingController? replyController,
    List<GroupInfo>? forumList,
    List<InterimPostModel>? posts,
    List<ReplyPostModel>? replyPosts,
    List<InterimSosMemberModel>? sosMembers,
}){
    return CommunitiesVM(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      communitiesTabController: communitiesTabController ?? this.communitiesTabController,
      replyController: replyController ?? this.replyController,
      forumList: forumList ?? this.forumList,
      posts: posts ?? this.posts,
      replyPosts: replyPosts ?? this.replyPosts,
      sosMembers: sosMembers ?? this.sosMembers,
    );
  }
}