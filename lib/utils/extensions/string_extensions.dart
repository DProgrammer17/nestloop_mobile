import 'package:intl/intl.dart';

extension StringCasesExtension on String {
  String get toCamelCase =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String get allToCapital => toUpperCase();

  String get toTitleCase => split(" ").map((str) => str.toCamelCase).join(" ");
}

extension StringListExtension on String {
  List<String> get toStringList =>
      split(RegExp(r'[\n,]+')).where((e) => e.isNotEmpty).toList();
}

extension StringDateExtension on String {
  DateTime get toDateYMD => DateFormat("yyyy-MM-dd").parse(this);

  String dateTo12HourFormat() {
    try {
      // Parse the ISO 8601 string to DateTime
      DateTime dateTime = DateTime.parse(this);

      // Format to 12-hour time format
      DateFormat formatter = DateFormat('h:mm a');
      return formatter.format(dateTime);
    } catch (e) {
      // Return original string if parsing fails
      return this;
    }
  }
}

extension StringEmailExtension on String {
  bool get isValidEmail {
    if (isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9]([a-zA-Z0-9._-]*[a-zA-Z0-9])?@[a-zA-Z0-9]([a-zA-Z0-9.-]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(this);
  }
}

extension Blank on String? {
  bool get isBlank {
    this?.trim();
    if (this != null && this!.isNotEmpty) return false;

    return true;
  }

  bool get isNotBlank {
    return !isBlank;
  }

  String? get str {
    this?.trim();
    if (this != null && this!.isNotEmpty) return this;

    return null;
  }
}
