enum TaskStatus {
  pending('PENDING', 'Pending'),
  completed('COMPLETED', 'Completed'),
  cancelled('CANCELLED', 'Cancelled'),
  deleted('DELETED', 'Deleted'),
  none('none', 'None');

  const TaskStatus(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension TaskStatusFromString on String? {
  TaskStatus? get jsonTaskStatus {
    return TaskStatus.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => TaskStatus.none,
    );
  }

  TaskStatus? get displayTaskStatus{
    return TaskStatus.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => TaskStatus.none,
    );
  }
}
