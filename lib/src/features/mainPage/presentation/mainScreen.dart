// ignore_for_file: file_names

// import 'dart:io';
import 'package:flutter/material.dart';
// import '../../../routing/routeNames.dart';
import '../../../utils/colors.dart';
import '../../../utils/text/mainPageText.dart';
// import '../domain/linearSales.dart';
import 'header.dart';
// import '../../../utils/imageString.dart';
// import '../../../utils/text/mainPageText.dart';
// import '../../search/presentation/searchScreen.dart';
// import 'attendanceViewWidget.dart';
// import 'attendanceWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late String geetingMsg;
  int _notificationCount = 1;
  bool _isLoading = false;

  void _handleIconButtonPressed() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 84, 188, 138),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          content: ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.done,
                color: Colors.green,
              ),
            ),
            title: Text(
              'Synchronize data successfully',
              style: TextStyle(color: textColor2, fontWeight: FontWeight.w500),
            ),
          ),
          duration: Duration(seconds: 2),
        ),
      );
    });
  }

  String dropdownvalue = 'This Month';

  var items = [
    'Today',
    'This Week',
    'This Month',
    'Quarter Present',
    'IThis Year',
  ];

  @override
  void initState() {
    super.initState();
    geetingMsg = greetingMessage();
  }

  void _onNewNotification() {
    setState(() {
      _notificationCount++;
    });
  }

  String greetingMessage() {
    var timeNow = DateTime.now().toLocal();
    if (timeNow.hour < 12 ||
        (timeNow.hour == 12 && timeNow.minute == 0 && timeNow.second == 0)) {
      return 'Good Morning...';
    } else if (timeNow.hour < 16 ||
        (timeNow.hour == 16 && timeNow.minute == 0 && timeNow.second == 0)) {
      return 'Good Afternoon...';
    } else if (timeNow.hour < 20 ||
        (timeNow.hour == 20 && timeNow.minute == 0 && timeNow.second == 0)) {
      return 'Good Evening...';
    } else {
      return 'Good Night...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarBg,
        automaticallyImplyLeading: false,
        // leading: Row(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(left: 2),
        //       child: InkWell(
        //         onTap: () {},
        //         child: const CircleAvatar(
        //           radius: 18,
        //           backgroundImage: AssetImage(profileImage),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text.rich(
              TextSpan(
                text: 'Hi ',
                style: TextStyle(color: textColor2, fontSize: 18),
                children: [
                  TextSpan(
                    text: userName,
                    children: [
                      TextSpan(text: '!'),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: _isLoading ? null : _handleIconButtonPressed,
                  icon: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.cached,
                          color: Colors.white,
                        ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Stack(
                    children: [
                      const Icon(
                        Icons.notifications_sharp,
                        size: 27,
                        color: Colors.white,
                      ),
                      if (_notificationCount > 0)
                        Positioned(
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 10,
                              minHeight: 10,
                            ),
                            child: Text(
                              _notificationCount > 99
                                  ? '99+'
                                  : '$_notificationCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Row(
        //       children: [
        //         Text(
        //           geetingMsg,
        //           style: const TextStyle(color: textColor, fontSize: 18),
        //         ),
        //         const SizedBox(width: 5),
        //         Text(
        //           userName.split(' ')[0],
        //           style: const TextStyle(color: textColor, fontSize: 18),
        //         ),
        //       ],
        //     ),
        //     Row(
        //       children: [
        //         IconButton(
        //           onPressed: () {
        //             // Navigator.pushNamed(context, RouteNames.searchScreen);
        //             Navigator.push(
        //               // animated navigation
        //               context,
        //               PageRouteBuilder(
        //                 pageBuilder: (context, animation, secondaryAnimation) {
        //                   return const SearchScreen();
        //                 },
        //                 transitionsBuilder:
        //                     (context, animation, secondaryAnimation, child) {
        //                   var begin = Offset(1.0, 0.0);
        //                   var end = Offset.zero;
        //                   var curve = Curves.ease;
        //                   var tween = Tween(begin: begin, end: end)
        //                       .chain(CurveTween(curve: curve));
        //                   var offsetAnimation = animation.drive(tween);
        //                   return SlideTransition(
        //                     position: offsetAnimation,
        //                     child: child,
        //                   );
        //                 },
        //               ),
        //             );
        //           },
        //           icon: const Icon(
        //             Icons.search,
        //             color: Colors.black,
        //           ),
        //         ),
        //         IconButton(
        //           onPressed: () {},
        //           icon: const Icon(
        //             Icons.sms_outlined,
        //             color: Colors.black,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
      // body: const Stack(
      //   children: [
      //     AttendanceWidget(),
      //     AttendanceViewWidget(),
      //   ],
      // ),
      body: ListView(
        children: const [
          HeaderMainScreen(),
        ],
      ),
    );
  }
}
