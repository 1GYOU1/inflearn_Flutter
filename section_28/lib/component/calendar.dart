import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:calendar_scheduler/const/color.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  const Calendar(
      {super.key,
      required this.focusedDay,
      required this.onDaySelected,
      required this.selectedDayPredicate});

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      border: Border.all(
        color: Colors.grey[200]!,
        width: 1.0,
      ),
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600]!,
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      locale: 'ko_KR',
      focusedDay: focusedDay, // 캘린더가 초점을 맞출 날짜(해당 날짜 기준으로 한 달씩 보여줌)
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        defaultDecoration: defaultBoxDecoration,
        weekendDecoration: defaultBoxDecoration,
        selectedDecoration: defaultBoxDecoration.copyWith(
          border: Border.all(
            color: primaryColor,
            width: 1.0,
          ),
        ),
        todayDecoration: defaultBoxDecoration.copyWith(
          color: primaryColor,
        ),
        outsideDecoration: defaultBoxDecoration.copyWith(
          border: Border.all(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
        defaultTextStyle: defaultTextStyle,
        weekendTextStyle: defaultTextStyle,
        selectedTextStyle: defaultTextStyle.copyWith(
          color: primaryColor,
        ),
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate,
    );
  }
}
