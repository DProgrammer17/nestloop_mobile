class CommunityPostNotification {
  final DateTime time; // e.g. "Today, 9:00 AM"
  final List<CommunityPost> posts;

  CommunityPostNotification({
    required this.time,
    required this.posts,
  });
}

class CommunityPost {
  final String id; // unique notification ID
  final DateTime time; // e.g. "Today, 9:00 AM"
  final Forum forum; // e.g. "Health and Fitness"
  final String topic; // e.g. "Anxiety"
  final Author author;
  final String type; //POST, REPLY, DM, COMMENT, REACTION
  final PostContent content;
  final List<PostReactions> reactions;
  final bool read;

  CommunityPost({
    required this.id,
    required this.time,
    required this.forum,
    required this.topic,
    required this.author,
    required this.content,
    required this.reactions,
    required this.type,
    this.read = true,
  });
}

class Author {
  final String name;
  final String avatarUrl;
  final DateTime postTime; // e.g. "1 hour ago"

  Author({
    required this.name,
    required this.avatarUrl,
    required this.postTime,
  });
}

class Forum {
  final String name;
  final String url;

  Forum({
    required this.name,
    required this.url,
  });
}

class PostContent {
  final String text; // main body of the post

  PostContent({
    required this.text,
  });
}

class PostReactions {
  final String reaction; //hearts, claps, comments
  final String sender;
  final String avatarUrl;

  PostReactions({
    required this.reaction,
    required this.sender,
    required this.avatarUrl,
  });
}
