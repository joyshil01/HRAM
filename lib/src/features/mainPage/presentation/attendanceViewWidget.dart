// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

class AttendanceViewWidget extends StatefulWidget {
  const AttendanceViewWidget({
    super.key,
  });

  @override
  State<AttendanceViewWidget> createState() => _AttendanceViewWidgetState();
}

class _AttendanceViewWidgetState extends State<AttendanceViewWidget> {
  late ScrollController horizontalScrollController;

  @override
  void initState() {
    super.initState();
    horizontalScrollController = ScrollController();
  }

  @override
  void dispose() {
    horizontalScrollController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> attendancePoint = [
    {
      'color': Colors.greenAccent,
      'attendanceName': 'Present',
    },
    {
      'color': Colors.blueAccent,
      'attendanceName': 'Leave',
    },
    {
      'color': Colors.pinkAccent,
      'attendanceName': 'Holi Day',
    },
    {
      'color': Colors.amberAccent,
      'attendanceName': 'Half Day',
    },
    {
      'color': Colors.red,
      'attendanceName': 'Absent',
    },
    {
      'color': Colors.grey,
      'attendanceName': 'Weekend',
    },
  ];

  List<Map<String, dynamic>> monthlyView = [
    {
      'date': '10',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '09',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 237, 225, 182),
      'tTime': '04:30:53',
      'ctime': '10:21:58',
      'oTime': '14:40:02',
    },
    {
      'date': '08',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '07',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '06',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '05',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '04',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '03',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '02',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
    {
      'date': '01',
      'month': 'Mar 2024',
      'day': 'Monday',
      'fColor': const Color.fromARGB(255, 224, 240, 229),
      'sColor': const Color.fromARGB(255, 224, 240, 229),
      'tTime': '08:10:53',
      'ctime': '10:21:58',
      'oTime': '19:02:41',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.55,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Card(
          elevation: 8,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 6,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 50,
                          child: Divider(
                            thickness: 5,
                          ),
                        ),
                        Text(
                          'Attendance histroy',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_month),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  controller: horizontalScrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: attendancePoint.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: attendancePoint[index]['color'],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          attendancePoint[index]['attendanceName'],
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  itemCount: monthlyView.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: Container(
                              color: monthlyView[index]['fColor'],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        monthlyView[index]['date'],
                                        style: const TextStyle(
                                          color: textColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        monthlyView[index]['month'],
                                        style: const TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        monthlyView[index]['day'],
                                        style: const TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.schedule,
                                            size: 20,
                                          ),
                                          Text(
                                            monthlyView[index]['ctime'],
                                            style: const TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.schedule,
                                            size: 20,
                                          ),
                                          Text(
                                            monthlyView[index]['oTime'],
                                            style: const TextStyle(
                                              color: textColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: monthlyView[index]['sColor'],
                              // Color.fromARGB(255, 230, 190, 190),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    size: 20,
                                  ),
                                  Text(
                                    monthlyView[index]['tTime'],
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
