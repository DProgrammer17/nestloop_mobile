import 'package:intl/intl.dart';

extension DateToStringExtension on DateTime {
  String get fullDateMonthDayFormat => DateFormat.yMMMMd('en_US').format(this);

  String get dayMonthYearFormat => DateFormat('d MMMM,y').format(this);

  String get monthYearFormat => DateFormat('MMMM y').format(this);
}

extension DateTimeExtension on DateTime {
  /// Safely adds months to a DateTime, handling edge cases like leap years
  /// and months with different numbers of days
  DateTime addMonths(int months) {
    if (months == 0) return this;

    int totalMonths = (year * 12) + month - 1 + months;
    int newYear = (totalMonths / 12).floor();
    int newMonth = (totalMonths % 12) + 1;

    // Handle the day, ensuring it doesn't exceed the last day of the target month
    int lastDayOfTargetMonth = DateTime(newYear, newMonth + 1, 0).day;
    int newDay = day > lastDayOfTargetMonth ? lastDayOfTargetMonth : day;

    return DateTime(
      newYear,
      newMonth,
      newDay,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
  }

  /// Adds days to a DateTime
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// Adds weeks to a DateTime
  DateTime addWeeks(int weeks) {
    return add(Duration(days: weeks * 7));
  }

  /// Adds years to a DateTime, handling leap year edge cases
  DateTime addYears(int years) {
    return addMonths(years * 12);
  }

  /// Comprehensive method to add multiple time units at once
  DateTime addTime({
    int years = 0,
    int months = 0,
    int weeks = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) {
    DateTime result = this;

    // Add years and months first (they affect the day calculation)
    if (years != 0) {
      int totalMonths = (result.year * 12) + result.month - 1 + (years * 12);
      int newYear = (totalMonths / 12).floor();
      int newMonth = (totalMonths % 12) + 1;
      int lastDayOfTargetMonth = DateTime(newYear, newMonth + 1, 0).day;
      int newDay = result.day > lastDayOfTargetMonth
          ? lastDayOfTargetMonth
          : result.day;
      result = DateTime(
        newYear,
        newMonth,
        newDay,
        result.hour,
        result.minute,
        result.second,
        result.millisecond,
        result.microsecond,
      );
    }

    if (months != 0) {
      int totalMonths = (result.year * 12) + result.month - 1 + months;
      int newYear = (totalMonths / 12).floor();
      int newMonth = (totalMonths % 12) + 1;
      int lastDayOfTargetMonth = DateTime(newYear, newMonth + 1, 0).day;
      int newDay = result.day > lastDayOfTargetMonth
          ? lastDayOfTargetMonth
          : result.day;
      result = DateTime(
        newYear,
        newMonth,
        newDay,
        result.hour,
        result.minute,
        result.second,
        result.millisecond,
        result.microsecond,
      );
    }

    // Add the time-based units
    if (weeks != 0 ||
        days != 0 ||
        hours != 0 ||
        minutes != 0 ||
        seconds != 0 ||
        milliseconds != 0 ||
        microseconds != 0) {
      result = result.add(
        Duration(
          days: weeks * 7 + days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
          microseconds: microseconds,
        ),
      );
    }

    return result;
  }

  /// Subtracts months from a DateTime
  DateTime subtractMonths(int months) {
    return addMonths(-months);
  }

  /// Subtracts days from a DateTime
  DateTime subtractDays(int days) {
    return addDays(-days);
  }

  /// Subtracts weeks from a DateTime
  DateTime subtractWeeks(int weeks) {
    return addWeeks(-weeks);
  }

  /// Subtracts years from a DateTime
  DateTime subtractYears(int years) {
    return addYears(-years);
  }

  /// Comprehensive method to subtract multiple time units at once
  DateTime subtractTime({
    int years = 0,
    int months = 0,
    int weeks = 0,
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int seconds = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) {
    return addTime(
      years: -years,
      months: -months,
      weeks: -weeks,
      days: -days,
      hours: -hours,
      minutes: -minutes,
      seconds: -seconds,
      milliseconds: -milliseconds,
      microseconds: -microseconds,
    );
  }

  /// Formats the current DateTime to 'yyyy-MM-dd' format
  String get formatted {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  /// Returns the last day of the month for this DateTime
  int get lastDayOfMonth {
    return DateTime(year, month + 1, 0).day;
  }
}

extension TimeStringExtension on String {
  String to12HourFormat() {
    try {
      // Split the time string by ':'
      final parts = split(':');
      if (parts.length != 2) {
        throw FormatException('Invalid time format');
      }

      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      // Validate hour and minute ranges
      if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
        throw FormatException('Invalid time values');
      }

      // Determine AM/PM
      final period = hour >= 12 ? 'PM' : 'AM';

      // Convert to 12-hour format
      final displayHour = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);

      // Format minute with leading zero if needed
      final displayMinute = minute.toString().padLeft(2, '0');

      return '$displayHour:$displayMinute$period';
    } catch (e) {
      // Return original string if parsing fails
      return this;
    }
  }
}
