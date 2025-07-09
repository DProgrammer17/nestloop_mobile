import 'package:intl/intl.dart';

abstract class HelperUtils {
  static String fullDateMonthDayFormat(DateTime date)=>  DateFormat.yMMMMd('en_US').format(date);

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
