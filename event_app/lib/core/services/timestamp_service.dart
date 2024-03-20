import 'package:flutter/material.dart';

import '../utilities/variables/app_texts.dart';

class TimestampService {
  // 
  /// Converts a given [timestamp] to a formatted date and time string.
  ///
  /// The [timestamp] is a string representation of a milliseconds
  /// value since the Unix epoch. This method first calls [toDate] to
  /// get the date part and [toTime] to get the time part. Then it
  /// concatenates them with a dash in between and returns the result.
  ///
  /// Returns a string in the format "YYYY-MM-DD - HH:MM".
  static String toDateTime(String timestamp) {
    // Get the date part
    String date_ = toDate(timestamp);

    // Get the time part
    String time_ = toTime(timestamp);

    // Concatenate the date and time with a dash
    return "$date_ - $time_";
  }
  
  /// Converts the given [seconds] to a formatted time string.
  ///
  /// The [seconds] represents the number of seconds. This method first
  /// converts the number of seconds to a [Duration] object. If the
  /// duration is less than 0, it means the time is invalid, so it
  /// returns the duration in seconds. Otherwise, it converts the
  /// duration to a string in the format "X s" where X is the number
  /// of seconds.
  ///
  /// Returns a string in the format "X s" where X is the number of
  /// seconds.
  static String secondToTime(int seconds) {
    // Initialize the time string with the number of seconds
    String time_ = "$seconds s";

    // Convert the number of seconds to a Duration object
    final duration = Duration(seconds: seconds);

    // If the duration is less than 0, the time is invalid
    if (duration.inMinutes < 0) {
      // Convert the number of seconds to a string
      String s = duration.inSeconds < 10
          ? "0${duration.inSeconds} s" // Add a leading 0 if needed
          : "${duration.inSeconds} s"; // Convert the number of seconds to a string
      time_ = s; // Update the time string
    }

    return time_; // Return the formatted time string
  }

  /// Converts a given timestamp to a time string in the format "hour:minute".
  ///
  /// The [timestamp] is a string representation of a timestamp in milliseconds
  /// since the Unix epoch. This method parses the timestamp, extracts the
  /// hour and minute components, and formats them into a string. If the hour
  /// or minute is less than 10, a leading 0 is added to ensure the string
  /// contains exactly 2 digits for each component.
  ///
  /// Returns a string in the format "hour:minute".
  static String toTime(String timestamp) {
    // Parse the timestamp into a DateTime object
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    
    // Extract the hour and minute components of the DateTime object
    String hour = _time.hour < 10 ? "0${_time.hour}" : _time.hour.toString();
    String min = _time.minute < 10 ? "0${_time.minute}" : _time.minute.toString();
    
    // Format the hour and minute into a time string
    String time_ = "$hour:$min";
    
    return time_;
  }

  /// Checks if two timestamps represent the same date.
  ///
  /// The [timestamp1] and [timestamp2] parameters are strings representing
  /// timestamps in milliseconds since the Unix epoch. This method parses the
  /// timestamps, extracts the year, month, and day components, and compares
  /// them to determine if the two timestamps represent the same date.
  ///
  /// Returns a boolean value indicating whether the two timestamps represent
  /// the same date.
  static bool isSameDate(String timestamp1, String timestamp2) {
    // Parse the first timestamp into a DateTime object
    DateTime time1_ =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp1));

    // Parse the second timestamp into a DateTime object
    DateTime time2_ =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp2));

    // Check if the year, month, and day components of the two DateTime objects are equal
    if ((time1_.year == time2_.year) &&
        (time1_.month == time2_.month) &&
        (time1_.day == time2_.day)) {
      // If they are equal, return true indicating they represent the same date
      return true;
    } else {
      // If they are not equal, return false
      return false;
    }
  }

  /// Calculates the number of days that have passed since a given timestamp.
  ///
  /// The [timestamp] parameter is a string representing a timestamp in milliseconds
  /// since the Unix epoch. The [nbreDays] parameter is an integer representing the
  /// number of days to add to the given timestamp.
  ///
  /// Returns an integer representing the number of days that have passed since the
  /// given timestamp.
  static int timeSpentInDdays(String timestamp, int nbreDays) {
    // Parse the given timestamp into a DateTime object
    DateTime time_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Add the specified number of days to the timestamp
    DateTime timeAdd_ = time_.add(Duration(days: nbreDays));

    // Calculate the difference between the added timestamp and the current time
    Duration spent_ = timeAdd_.difference(DateTime.now());

    // Return the number of days that have passed since the given timestamp
    int inDays_ = spent_.inDays;
    return inDays_;
  }

  /// Calculates the time that has passed since a given timestamp.
  ///
  /// The [timestamp] parameter is a string representing a timestamp in milliseconds
  /// since the Unix epoch. The [nbreHours] parameter is an integer representing the
  /// number of hours to add to the given timestamp.
  ///
  /// Returns a string representing the time that has passed since the given
  /// timestamp. The string is formatted as "X hours Y minutes" or "X days Y hours"
  /// depending on the amount of time that has passed.
  static String timeSpent(String timestamp, int nbreHours) {
    // Parse the given timestamp into a DateTime object
    DateTime time_ = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    // Add the specified number of hours to the timestamp
    DateTime timeAdd_ = time_.add(Duration(hours: nbreHours));
    // Calculate the difference between the added timestamp and the current time
    Duration spent_ = timeAdd_.difference(DateTime.now());

    // Calculate the number of seconds that have passed
    int secs_ = spent_.inSeconds;

    // Define the unit names for seconds, minutes, hours, and days
    String unitySecs_ = "second(s)";
    String unityMins_ = "minute(s)";
    String unityHours_ = "hour(s)";
    String unityDays_ = "day(s)";

    // Initialize the response string
    String response_ = "";

    // If seconds are less than 0, return an empty string
    if(secs_ < 0) {
      response_ = "";
    }
    // If seconds are less than or equal to 60, display seconds
    else if (secs_ <= 60) {
      response_ += "$secs_ $unitySecs_";
    }
    // If 3600 is greater than seconds and seconds are greater than 60, display minutes and seconds
    else if((3600 > secs_) && (secs_ > 60)){
      int resMins =  int.parse("${(secs_ / 60)}");
      int resSecs = secs_ % 60;
      response_ += "$resMins $unityMins_ $resSecs $unitySecs_";
    }
    // If 86400 is greater than seconds and seconds are greater than 3600, display hours and minutes
    else if((86400 > secs_) && (secs_ > 3600)){
      double res = secs_ / 3600;
      int resHours = res.toInt();
      int resMins = secs_ % 60;
      response_ += "$resHours $unityHours_ $resMins $unityMins_";
    }
    // If seconds are greater than or equal to 86400, display days and hours
    else if(secs_ >= 86400){
      int resDays = int.parse("${(secs_ / 86400)}");
      int resHours = int.parse("${((secs_ % 86400) / 3600)}");
      response_ += "$resDays $unityDays_ $resHours $unityHours_";
    }

    // Return the formatted time string
    return response_;
  }

  /// Converts a given timestamp to a formatted date string.
  ///
  /// The [timestamp] parameter is a string representing a timestamp in milliseconds
  /// since the Unix epoch. This method parses the timestamp, extracts the date
  /// components (day, month, and year), and formats them into a string.
  ///
  /// Returns a string in the format "day month year".
  static String toDate(String timestamp) {
    // Parse the timestamp into a DateTime object
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Extract the day, month, and year components from the DateTime object
    String day = _time.day < 10 ? "0${_time.day}" : _time.day.toString();
    String year = _time.year.toString();

    // Map the month number to the corresponding month name
    String month;
    switch (_time.month) {
      case 1:
        month = "Jan";
        break;
      case 2:
        month = "Fev";
        break;
      case 3:
        month = "Mar";
        break;
      case 4:
        month = "Avr";
        break;
      case 5:
        month = "Mai";
        break;
      case 6:
        month = "Juin";
        break;
      case 7:
        month = "Juil";
        break;
      case 8:
        month = "Aôut";
        break;
      case 9:
        month = "Sept";
        break;
      case 10:
        month = "Oct";
        break;
      case 11:
        month = "Nov";
        break;
      case 12:
        month = "Dec";
        break;
      default:
        month = "Janv";
    }

    // Concatenate the day, month, and year components to form the date string
    String _date = "$day $month $year";
    return _date;
  }

  /// Retrieves the day component of a given timestamp and returns it as a
  /// string.
  ///
  /// The [timestamp] parameter is a string representing a timestamp in
  /// milliseconds since the Unix epoch.
  ///
  /// Returns a string representing the day component of the timestamp.
  static String getDay(String timestamp) {
    // Parse the timestamp into a DateTime object
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    
    // Extract the day component from the DateTime object
    // If the day is less than 10, prefix it with '0'
    String day = _time.day < 10 ? "0${_time.day}" : _time.day.toString();
    
    // Return the day component as a string
    return day;
  }

  /// Returns the name of the month corresponding to the given timestamp.
  ///
  /// The [timestamp] parameter is a string representing a timestamp in milliseconds
  /// since the Unix epoch.
  ///
  /// Returns a string representing the name of the month.
  static String getMonth(String timestamp) {
    // Parse the timestamp into a DateTime object
    DateTime time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Define the name of the month
    String month;

    // Map the month number to the corresponding month name
    switch (time.month) {
      case 1:
        month = "Janvier";
        break;
      case 2:
        month = "Février";
        break;
      case 3:
        month = "Mars";
        break;
      case 4:
        month = "Avril";
        break;
      case 5:
        month = "Mai";
        break;
      case 6:
        month = "Juin";
        break;
      case 7:
        month = "Juillet";
        break;
      case 8:
        month = "Aôut";
        break;
      case 9:
        month = "Septembre";
        break;
      case 10:
        month = "Octobre";
        break;
      case 11:
        month = "Novembre";
        break;
      case 12:
        month = "Decembre";
        break;
      default:
        month = "Janvier";
    }

    // Return the name of the month
    return month;
  }

  /// Returns the year from a given timestamp.
  ///
  /// The [timestamp] parameter is a string representing a timestamp in milliseconds
  /// since the Unix epoch. This function parses the timestamp and extracts the year
  /// component, and returns it as a string.
  ///
  /// Returns a string representing the year.
  static String getYear(String timestamp) {
    // Parse the timestamp into a DateTime object
    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));

    // Extract the year component from the DateTime object
    String year = _time.year.toString();

    // Return the year as a string
    return year;
  }

  /// Shows a date picker dialog and returns the selected date.
  ///
  /// The [context] parameter is the build context used to display the dialog.
  /// The [startDate] parameter is an optional initial date for the picker. If
  /// not provided, the current date is used.
  ///
  /// Returns a [Future] that completes with the selected [DateTime] if the user
  /// taps the "Confirm" button, or with null if the user taps the "Cancel" button.
  static Future<DateTime?> showTheDatePicker(BuildContext context, {DateTime? startDate}) async {
    // Show the date picker dialog and wait for the user to select a date.
    // The initial date is set to [startDate] if provided, otherwise the current date is used.
    // The picker allows the user to select dates from [startDate] to 365 days from now.
    // The "Confirm" and "Cancel" buttons are translated using [AppStrings].
    return await showDatePicker(
      context: context, // Build context used to display the dialog.
      initialDate: startDate ?? DateTime.now(), // Initial date for the picker.
      firstDate: startDate ?? DateTime.now(), // First selectable date.
      lastDate: DateTime.now().add(const Duration(days: 365)), // Last selectable date.
      confirmText: AppStrings.toConfirme, // Text for the "Confirm" button.
      cancelText: AppStrings.toCancel, // Text for the "Cancel" button.
      helpText: AppStrings.date, // Text displayed at the top of the picker.
    );
  }

  /// Shows a time picker dialog and returns the selected time.
  ///
  /// The [context] parameter is the build context used to display the dialog.
  /// 
  /// Returns a [Future] that completes with the selected [TimeOfDay] if the user
  /// taps the "Confirm" button, or with null if the user taps the "Cancel" button.
  static Future<TimeOfDay?> showTheTimePicker(BuildContext context) async {
    // Shows the time picker dialog and waits for the user to select a time.
    // The initial time is set to the current time.
    // The "Confirm" and "Cancel" buttons are translated using [AppStrings].
    // The help text is translated using [AppStrings].
    return await showTimePicker(
      context: context, // Build context used to display the dialog.
      initialTime: TimeOfDay.now(), // Initial time for the picker.
      confirmText: AppStrings.toConfirme, // Text for the "Confirm" button.
      cancelText: AppStrings.toCancel, // Text for the "Cancel" button.
      helpText: AppStrings.hourAndMinutes, // Text displayed at the top of the picker.
    );
  }

  /// Converts a [TimeOfDay] object to a string representing the time in the format "hour:minute am/pm".
  ///
  /// The [timeOfDay] parameter is the [TimeOfDay] object to be converted.
  ///
  /// Returns a string representing the time in the format "hour:minute am/pm".
  static String toHour(TimeOfDay timeOfDay) {
    // Extract the hour, minute and day period from the timeOfDay object.
    String time = '${timeOfDay.hour}:${timeOfDay.minute}';
    String hour = timeOfDay.hour < 10 ? '0${timeOfDay.hour}' : '${timeOfDay.hour}';
    String minutes = timeOfDay.minute < 10 ? '0${timeOfDay.minute}' : '${timeOfDay.minute}';
    String ampm = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

    // Concatenate the hour, minute and day period into a single string.
    time = '$hour:$minutes $ampm';

    return time;
  }
}
