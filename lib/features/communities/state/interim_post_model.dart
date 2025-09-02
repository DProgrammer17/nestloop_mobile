import 'package:nest_loop_mobile/features/home/state/interim_community_activity_model.dart';

class ReplyPostModel {
  final String id;
  final String topic;
  final String post;
  final int views;
  final List<InterimPostModel> replyPosts;

  const ReplyPostModel({
    required this.id,
    required this.topic,
    required this.post,
    required this.views,
    required this.replyPosts,
  });
}

class InterimPostModel {
  final String id; // unique post ID
  final String topic; // e.g. "Anxiety"
  final Author author;
  final String content;
  final int views;
  final List<PostReactions> reactions;
  final List<RepliesData> replies;

  const InterimPostModel({
    required this.id,
    required this.topic,
    required this.author,
    required this.content,
    required this.views,
    required this.reactions,
    required this.replies,
  });
}

class RepliesData {
  final String senderId;
  final String sender;
  final String url;
  final String messageId;
  final String message;
  final DateTime postTime;
  final int views;

  const RepliesData({
    required this.senderId,
    required this.sender,
    required this.url,
    required this.messageId,
    required this.message,
    required this.postTime,
    required this.views,
  });
}
