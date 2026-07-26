import 'package:portfolio/src/models/date_difference.dart';
import 'package:portfolio/src/utils/app_constants.dart';

class DateService {
  DateDifference getExperienceYears() =>
      between(AppConstants.startDate, DateTime.now());

  /// Whole years and months between [start] and [end].
  DateDifference between(DateTime start, DateTime? end) {
    final DateTime to = end ?? DateTime.now();
    int years = to.year - start.year;
    int months = to.month - start.month;

    if (to.day < start.day) {
      months--;
    }
    if (months < 0) {
      years--;
      months += 12;
    }

    return DateDifference(years, months);
  }

  /// Human readable span, e.g. `2 yrs 4 mos`, `7 mos`, `1 yr`.
  String formatDuration(DateTime start, DateTime? end) {
    final DateDifference difference = between(start, end);
    final List<String> parts = [];

    if (difference.years > 0) {
      parts.add('${difference.years} ${difference.years == 1 ? 'yr' : 'yrs'}');
    }
    if (difference.months > 0) {
      parts.add(
        '${difference.months} ${difference.months == 1 ? 'mo' : 'mos'}',
      );
    }

    return parts.isEmpty ? '< 1 mo' : parts.join(' ');
  }
}
