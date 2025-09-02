enum TaskCategories {
  all('ALL', 'All'),
  medication('MEDICATION', 'Medication'),
  therapy('THERAPY', 'Therapy'),
  appointment('APPOINTMENT', 'Appointment'),
  others('OTHERS', 'Others'),
  none('none', 'None');

  const TaskCategories(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension TaskCategoriesFromString on String? {
  TaskCategories? get jsonTaskCategories {
    return TaskCategories.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => TaskCategories.none,
    );
  }

  TaskCategories? get displayTaskCategories{
    return TaskCategories.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => TaskCategories.none,
    );
  }
}
