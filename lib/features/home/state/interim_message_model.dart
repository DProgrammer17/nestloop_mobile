class InterimMessageModel {
  final String id; // unique identifier for the chat
  final String sender;
  final String url;
  final String lastMessage;
  final DateTime time;
  final int unreadCount;
  final bool pinned;

  InterimMessageModel({
    required this.id,
    required this.sender,
    required this.url,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    this.pinned = false,
  });
}