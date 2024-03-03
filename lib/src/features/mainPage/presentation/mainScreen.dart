// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/imageString.dart';
import '../../../utils/text/mainPageText.dart';
import 'attendanceViewWidget.dart';
import 'attendanceWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit App'),
            content: const Text('Do you want to exit this app?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.menu,
                  //     color: textColor,
                  //   ),
                  // ),
                  const SizedBox(width: 8),
                  const Text(
                    goodMoring,
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    userName.split(' ')[0],
                    style: const TextStyle(color: textColor, fontSize: 16),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
            ],
          ),
        ),
        body: const Stack(
          children: [
            AttendanceWidget(),
            AttendanceViewWidget(),
          ],
        ),
      ),
    );
  }
}
