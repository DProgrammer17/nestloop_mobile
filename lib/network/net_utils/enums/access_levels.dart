enum AccessLevels {
  noAccess('NO_ACCESS', 'No Access'),
  viewAccess('VIEW_ACCESS', 'View Access'),
  editAccess('EDIT_ACCESS', 'Edit Access'),
  none('none', 'None');

  const AccessLevels(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension AccessLevelsFromString on String? {
  AccessLevels? get jsonAccessLevels {
    return AccessLevels.values.firstWhere(
      (element) => element.jsonString == this,
      orElse: () => AccessLevels.none,
    );
  }

  AccessLevels? get displayAccessLevels {
    return AccessLevels.values.firstWhere(
      (element) => element.displayString == this,
      orElse: () => AccessLevels.none,
    );
  }
}
