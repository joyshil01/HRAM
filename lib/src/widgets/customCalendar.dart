// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Customcalendar extends StatefulWidget {
  const Customcalendar({Key? key}) : super(key: key);

  @override
  State<Customcalendar> createState() => _CustomcalendarState();
}

class _CustomcalendarState extends State<Customcalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, List<String>> _googleHolidays = {
    DateTime.utc(2024, 3, 8): ['New Day'],
    DateTime.utc(2024, 8, 15): ['Independence Day'],
    DateTime.utc(2024, 12, 25): ['Christmas Day'],
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            headerStyle: HeaderStyle(
              titleTextFormatter: (date, locale) {
                return '${date.year} ${DateFormat.MMM().format(date)}';
              },
              titleTextStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              headerPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            weekendDays: const [DateTime.saturday, DateTime.sunday],
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: const CalendarStyle(
              weekendTextStyle: TextStyle(color: Colors.red),
              outsideTextStyle: TextStyle(color: Colors.grey),
              holidayTextStyle: TextStyle(color: Colors.red),
            ),
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, date, events) {
                if (_googleHolidays.containsKey(date)) {
                  return Container(
                    height: 6,
                    width: 6,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          if (_selectedDay != null && _googleHolidays.containsKey(_selectedDay))
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child: Divider(
                                      thickness: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            _googleHolidays[_selectedDay!]!.join(', '),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
