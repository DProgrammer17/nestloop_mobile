class GroupInfo {
  final String id;
  final String name;
  final String description;
  final String iconUrl;
  final int membersCount;
  final int newPostsCount;
  final bool isJoined;

  GroupInfo({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.membersCount,
    required this.newPostsCount,
    this.isJoined = false,
  });
}
