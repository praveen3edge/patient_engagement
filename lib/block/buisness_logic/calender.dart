import 'package:flutter/material.dart';


List<DateTime> generateDates(DateTime baseDate) {
  List<DateTime> dateList = [];
  DateTime previousMonth = DateTime(baseDate.year, baseDate.month, 0);
  int lastMonthRemainingDate = previousMonth.weekday;
  for (int i = 1; i <= lastMonthRemainingDate; i++) {
    dateList.add(
        previousMonth.subtract(Duration(days: lastMonthRemainingDate - i)));
  }
  for (int i = 0; i < (42 - lastMonthRemainingDate); i++) {
    dateList.add(previousMonth.add(Duration(days: i + 1)));
  }
  return dateList;
}