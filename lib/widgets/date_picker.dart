import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medoloc/strings/app_color.dart';
import 'package:medoloc/strings/strings.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Function(DateTime, DateTime) onDaySelected;
  final Function(DateTime) onPageChanged;

  const DatePickerWidget({
    Key? key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        children: [
          // Custom Header with Arrows and Month Title
          Container(
            height: 52,
            width: 380,
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
            decoration: const BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7), topRight: Radius.circular(7)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Month title
                Text(DateFormat.yMMMM().format(focusedDay), style: whitem16),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        onPageChanged(DateTime(focusedDay.year,
                            focusedDay.month - 1, focusedDay.day));
                      },
                      icon: const Icon(Icons.chevron_left, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {
                        onPageChanged(DateTime(focusedDay.year,
                            focusedDay.month + 1, focusedDay.day));
                      },
                      icon:
                          const Icon(Icons.chevron_right, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // TableCalendar Widget
          TableCalendar(
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: onDaySelected,
            onPageChanged: onPageChanged,
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: AppColor.primary,
                shape: BoxShape.circle,
              ),
              todayDecoration: const BoxDecoration(
                color: AppColor.primary,
                shape: BoxShape.circle,
              ),
              cellMargin: EdgeInsets.all(0), // Reducing space between cells
              tablePadding: EdgeInsets.all(0),
              defaultTextStyle:
                  subregular15, // Reduce font size for default days
              weekendTextStyle: subregular15, // Reduce font size for weekends
              selectedTextStyle: whiteregular15, // For selected days
              outsideDaysVisible: false,
            ),
            headerVisible: false,
  daysOfWeekStyle: DaysOfWeekStyle(
    weekdayStyle: subregular15, // Reduced font size for weekday headers
    weekendStyle: subregular15 // Reduced font size for weekend headers
  ),

   calendarFormat: CalendarFormat.month,
  rowHeight: 40, // Reduce row height
  daysOfWeekHeight: 25,
          ),
        ],
      ),
    );
  }
}
