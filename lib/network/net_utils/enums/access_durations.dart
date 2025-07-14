enum AccessDurations {
  permanent('PERMANENT', 'Permanent'),
  ongoing('ONGOING', 'Ongoing'),
  expiry('EXPIRY', 'Expiry'),
  none('NONE', 'None');

  const AccessDurations(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension AccessDurationsFromString on String? {
  AccessDurations? get jsonAccessDurations {
    return AccessDurations.values.firstWhere(
      (element) => element.jsonString == this,
      orElse: () => AccessDurations.none,
    );
  }

  AccessDurations? get displayAccessDurations {
    return AccessDurations.values.firstWhere(
      (element) => element.displayString == this,
      orElse: () => AccessDurations.none,
    );
  }
}
