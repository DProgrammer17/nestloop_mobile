enum DateFilterOptions {
  day('DAY', 'Day'),
  month('MONTH', 'Month'),
  week('WEEK', 'Week'),
  none('none', 'None');

  const DateFilterOptions(this.jsonString, this.displayString);
  final String jsonString;
  final String displayString;
}

extension DateFilterOptionsFromString on String? {
  DateFilterOptions? get jsonDateFilterOptions {
    return DateFilterOptions.values.firstWhere(
          (element) => element.jsonString == this,
      orElse: () => DateFilterOptions.none,
    );
  }

  DateFilterOptions? get displayDateFilterOptions {
    return DateFilterOptions.values.firstWhere(
          (element) => element.displayString == this,
      orElse: () => DateFilterOptions.none,
    );
  }
}
