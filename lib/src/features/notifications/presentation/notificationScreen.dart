import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/imageString.dart';
import '../../../utils/text/mainPageText.dart';
import '../../search/presentation/searchScreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late String geetingMsg;

  @override
  void initState() {
    super.initState();
    geetingMsg = greetingMessage();
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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: InkWell(
                onTap: () {},
                child: const CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
            ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  geetingMsg,
                  style: const TextStyle(color: textColor, fontSize: 18),
                ),
                const SizedBox(width: 5),
                Text(
                  userName.split(' ')[0],
                  style: const TextStyle(color: textColor, fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, RouteNames.searchScreen);
                    Navigator.push(
                      // animated navigation
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const SearchScreen();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          var begin = Offset(1.0, 0.0);
                          var end = Offset.zero;
                          var curve = Curves.ease;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.sms_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
