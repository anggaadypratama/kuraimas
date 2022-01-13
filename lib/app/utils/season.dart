abstract class Season {
  static getSeason() {
    DateTime now = DateTime.now();
    int month = now.month;

    return month.clamp(3, 5) == month
        ? 'spring'
        : month.clamp(6, 8) == month
            ? 'summer'
            : month.clamp(9, 11) == month
                ? 'fall'
                : 'winter';
  }
}
