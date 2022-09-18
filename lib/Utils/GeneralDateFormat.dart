import 'package:intl/intl.dart';

/// Get date as a string for display.
String getFormattedDate(String date) {
  /// Convert into local date format.
  var localDate = DateTime.parse(date).toLocal();

  /// inputFormat - format getting from api or other func.
  /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
  /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
  /// 2022-04-29
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(localDate.toString());

  /// outputFormat - convert into format you want to show.
  var outputFormat = DateFormat('dd MMM yyyy');
  var outputDate = outputFormat.format(inputDate);

  return outputDate.toString();
}

String getDateFromTimeSTamp(String date) {
  /// Convert into local date format.
  var localDate = DateTime.parse(date).toLocal();

  /// inputFormat - format getting from api or other func.
  /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
  /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var inputDate = inputFormat.parse(localDate.toString());

  /// outputFormat - convert into format you want to show.
  var outputFormat = DateFormat('dd MMM yyyy, hh:mm a');
  var outputDate = outputFormat.format(inputDate);

  return outputDate.toString();
}

String displayDateFromAPI(String date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  var date1 = inputFormat.parse(date);

  var outputFormat = DateFormat('dd MMM yyyy  hh:mm a');
  var date2 = outputFormat.format(date1);
  var date2String = outputFormat.format(date1); // "2019-08-18"
  return date2.toString();
}

String getFormattedYear(String date) {
  var inputFormat = DateFormat('yyyy-MM-dd');
  var date1 = inputFormat.parse(date);

  var outputFormat = DateFormat('dd MMM yyyy');
  var date2 = outputFormat.format(date1);
  var date2String = outputFormat.format(date1); // "2019-08-18"
  return date2.toString();
}

String getAgeFromDOB(String birthDateString) {
  String datePattern = "yyyy-MM-dd";

  DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
  DateTime today = DateTime.now();

  int yearDiff = today.year - birthDate.year;
  int monthDiff = today.month - birthDate.month;
  int dayDiff = today.day - birthDate.day;

  return yearDiff.toString();
}

String dateConversion(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final twoday = DateTime(now.year, now.month, now.day - 2);
  final threeday = DateTime(now.year, now.month, now.day - 3);
  final fourday = DateTime(now.year, now.month, now.day - 4);
  final fiveday = DateTime(now.year, now.month, now.day - 5);
  final sixday = DateTime(now.year, now.month, now.day - 6);
  final sevenday = DateTime(now.year, now.month, now.day - 7);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);

  final dateToCheck = date;
  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if (aDate == today) {
    var outputDate = "Today";
    return outputDate;
  } else if (aDate == yesterday) {
    var outputDate = "1 Day ago";
    return outputDate;
  } else if (aDate == twoday) {
    var outputDate = "2 Days ago";
    return outputDate;
  } else if (aDate == threeday) {
    var outputDate = "3 Days ago";
    return outputDate;
  } else if (aDate == fourday) {
    var outputDate = "4 Days ago";
    return outputDate;
  } else if (aDate == fiveday) {
    var outputDate = "5 Days ago";
    return outputDate;
  } else if (aDate == sixday) {
    var outputDate = "6 Days ago";
    return outputDate;
  } else if (aDate == sevenday) {
    var outputDate = "1 Week ago";
    return outputDate;
  } else {
    var outputDate = getFormattedDate(dateToCheck.toString());
    return outputDate;
  }
}

String dateConversionToday(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);

  final dateToCheck = date;
  final aDate = DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
  if (aDate == today) {
    var outputDate = "Today";
    return outputDate;
  } else if (aDate == yesterday) {
    var outputDate = "Yesterday";
    return outputDate;
  } else {
    var outputDate = getFormattedDate(dateToCheck.toString());
    return outputDate;
  }
}

String getTime (String date) {
  var date1 = DateFormat('HH:mm:ss').parse(date);
  var date2 = DateFormat('hh:mm a').format(date1);
  return date2.toString();
}
String getTimeAPIFormat (String date) {
  var date1 = DateFormat('hh:mm a').parse(date);
  var date2 = DateFormat('HH:mm:ss').format(date1);
  return date2.toString();
}
