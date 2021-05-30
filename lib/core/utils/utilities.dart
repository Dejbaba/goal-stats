import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Utilities {
  static String dateFormatter(String date) {
    var formatter = new DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(date);
    String formatted = formatter.format(dateTime);
    var reformatDate = formatted.split("-");
    String formattedDate =
        reformatDate[2] + "-" + reformatDate[1] + "-" + reformatDate[0];

    print(formattedDate);
    return formattedDate;
  }

  static String yearMonthDay({String date}) {
    var reformatDate = date.split("-");
    String formattedDate =
        reformatDate[2] + "-" + reformatDate[1] + "-" + reformatDate[0];
    return formattedDate;
  }

  ///convert datetime format to Month, Day, Year and time
  static String monthDayYearAndTime({DateTime date}) {
    return "${DateFormat.yMMMd().format(date)} ${DateFormat.jm().format(date)}";
  }

  ///convert datetime format to day and abbrev.month
  static String dayAndAbbrevMonth({DateTime date}) {
    return "${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)}";
  }

  static String time({DateTime date}) {
    return "${DateFormat.jm().format(date)}";
  }

  ///initialize date-picker and format date picked
  static Future<dynamic> selectDate({BuildContext context}) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1700),
        lastDate: new DateTime(2100));
    if (picked != null) {
      return Utilities.dateFormatter(picked.toString());
    }
    return null;
  }

  ///formats large figures(eg 5000 -> 5k
  static String formatFigure({double largeFigure}) {
    String _formattedNumber = NumberFormat.compact().format(largeFigure);
    return _formattedNumber;
  }

  ///format currency
  static String formatAmount({double amount}) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    String formattedAmount = oCcy.format(amount);
    return formattedAmount;
  }

  ///convert datetime format to Month and Year
  static String monthAndYear({DateTime date}) {
    return "${DateFormat.yMMM().format(date)}";
  }

  ///convert datetime format to Month, Day and Year
  static String dateAndTime({DateTime date}) {
    return "${DateFormat.yMMMd().format(date)}";
  }

  ///convert datetime format to Day/Month/Year
  static String dayMonthYear({DateTime date}) {
    return "${DateFormat.d().format(date)}/${DateFormat.M().format(date)}/${DateFormat.y().format(date)}";
  }




  static String getErrorMessage({String message}) {
    String returningMessage;
    if (message == "Connection failed" ||
        message.toString().contains("Failed host lookup")) {
      returningMessage =
          "Error establishing internet connection. Please try again";
    } else if (message.toString().contains("Future not completed")) {
      returningMessage =
          "Slow internet connection. Please check your internet connection and try again";
    } else if (message == "Internal Server Error") {
      returningMessage = "An error occurred. Please try again";
    } else {
      returningMessage = message;
    }

    return returningMessage;
  }


}
