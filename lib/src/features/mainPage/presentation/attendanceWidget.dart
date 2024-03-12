// ignore_for_file: file_names, constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../utils/colors.dart';

enum ButtonState {
  CheckIn,
  CheckOut,
  Disabled,
}

class AttendanceWidget extends StatefulWidget {
  const AttendanceWidget({
    super.key,
  });

  @override
  State<AttendanceWidget> createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  // bool isCheckedIn = false;
  DateFormat dayCount = DateFormat('EEEE');
  DateFormat day = DateFormat('dd');
  DateFormat month = DateFormat('MMM');
  DateFormat year = DateFormat('yyyy');
  DateTime? checkInTime;
  DateTime? checkOutTime;
  ButtonState buttonState = ButtonState.CheckIn;

  late Timer _timer;
  int _hours = 0;
  int _minutes = 0;
  int _seconds = 0;

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        _seconds = (timer.tick % 60);
        _minutes = (timer.tick ~/ 60) % 60;
        _hours = (timer.tick ~/ 3600);
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  String formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  bool _isButtonVisible() {
    return buttonState != ButtonState.Disabled;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: constraints.maxHeight / 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Check-in',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${checkInTime?.hour ?? '00'}:${checkInTime?.minute ?? '00'}:${checkInTime?.second ?? '00'}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 23, 144, 85),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            dayCount.format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${day.format(DateTime.now())}-${month.format(DateTime.now())}-${year.format(DateTime.now())}',
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Check-out',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${checkOutTime?.hour ?? '00'}:${checkOutTime?.minute ?? '00'}:${checkOutTime?.second ?? '00'}',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 244, 108, 98),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Current Address: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'HFPP+2P9, Newtown, Chakpachuria, 700156, India',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text.rich(
                              TextSpan(
                                text: 'Invalid Location: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'You are 15378 Metres away from office',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.location_on,
                    size: 40,
                  ),
                  label: const Text(
                      'HFPP+2P9, Newtown, Chakpachuria, 700156, India'),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Hrs',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatTime(_hours),
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const Text(
                        'Min',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatTime(_minutes),
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const Text(
                        'Sec',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        formatTime(_seconds),
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Visibility(
                visible: _isButtonVisible(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonState == ButtonState.CheckOut
                            ? const Color.fromARGB(255, 239, 206, 204)
                            : const Color.fromARGB(255, 212, 241, 213),
                      ),
                      onPressed: () {
                        setState(() {
                          if (buttonState == ButtonState.CheckIn) {
                            checkInTime = DateTime.now();
                            startTimer();
                            buttonState = ButtonState.CheckOut;
                          } else if (buttonState == ButtonState.CheckOut) {
                            checkOutTime = DateTime.now();
                            stopTimer();
                            buttonState = ButtonState.Disabled;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          buttonState == ButtonState.CheckIn
                              ? 'Check-in'
                              : 'Check-out',
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (buttonState == ButtonState.Disabled)
                Text(
                  'Today time: ${formatTime(_hours)}:${formatTime(_minutes)}:${formatTime(_seconds)}',
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
