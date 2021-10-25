extension DateOnlyCompare on DateTime {
  bool isOlderThan(DateTime other) {
    if (year < other.year) {
      return false;
    } else if (year == other.year && month < other.month) {
      return false;
    } else if (year == other.year && month == other.month && day < other.day) {
      return false;
    } else {
      return true;
    }
  }
}
