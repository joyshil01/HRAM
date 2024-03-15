// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, unused_element

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrm/src/features/mainPage/presentation/mainScreen.dart';
// import '../features/formDefinitions/presentation/formDefinitionDetails.dart';
import '../features/formDefinitions/presentation/formDefinitionScreen.dart';
import '../features/formDefinitions/presentation/formScreen.dart';
import '../features/notifications/presentation/notificationScreen.dart';
import '../features/others/presentation/othersScreen.dart';
// import 'customCalendar.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  // int _notificationCount = 1;

  final List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    FormDefinitionScreen(),
    FormScreen(),
    NotificationScreen(),
    othersScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                  Navigator.pop(context);
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
        return false;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_sharp),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dehaze),
              label: 'Lists',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_sharp,
                size: 35,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                size: 35,
              ),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dataset),
              label: 'Other',
            ),
          ],
        ),
      ),
    );
  }
}
