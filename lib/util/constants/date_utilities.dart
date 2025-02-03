import 'package:intl/intl.dart';

class PDateUtil {
  static const String dobFormateDDMMYYYY = 'yyyy-MM-dd';
  static const String dobFormatTYYYYMMDDSLASH = 'yyyy-MM-dd';
  static const String dayMonthYear = 'dd MMM yyyy';

  static String getToday(String dateFormat) {
    return DateFormat(dateFormat).format(DateTime.now());
  }

  static String getDate(String dateFormat, DateTime date) {
    return DateFormat(dateFormat).format(date);
  }

  static DateTime parse(String dateFormat, String date) {
    return DateFormat(dateFormat).parse(date);
  }

  static String getTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static String remainingDayFromDateTime(DateTime targetDate) {
    DateTime currentDate = DateTime.now();
    Duration difference = targetDate.difference(currentDate);
    int remainingDays = difference.inDays;
    return remainingDays.toString();
  }
}
