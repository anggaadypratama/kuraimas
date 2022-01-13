import 'package:intl/intl.dart';

abstract class Time {
  static String greetings() {
    List<String> time = <String>['Morning', 'Afternoon', 'Evening', 'Night'];
    DateTime now = DateTime.now();
    int hoursTime = int.parse(DateFormat.H().format(now));

    String timeMessage = hoursTime.clamp(4, 10) == hoursTime
        ? time[0]
        : hoursTime.clamp(11, 14) == hoursTime
            ? time[1]
            : hoursTime.clamp(15, 19) == hoursTime
                ? time[2]
                : time[3];

    return timeMessage;
  }
}
