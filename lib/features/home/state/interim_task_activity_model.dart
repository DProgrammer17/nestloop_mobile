class TaskNotification {
  final String id;
  final DateTime time;
  final String message;
  final bool read;

  TaskNotification({
    required this.id,
    required this.time,
    required this.message,
    this.read = true,
  });
}