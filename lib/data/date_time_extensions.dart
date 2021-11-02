extension DateOnlyCompare on DateTime {
  bool isOlderThan(DateTime other) {
    if (year < other.year) {
      return false;
    } else if (month < other.month) {
      return false;
    } else if (day < other.day) {
      return false;
    } else {
      return true;
    }
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
