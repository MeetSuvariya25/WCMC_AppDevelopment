import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:notifier_app_p5/InstantNotification.dart';
import 'package:notifier_app_p5/ScheduleNotification.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  int _page = 0;
  final _pageController = PageController();
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(

        height:60.0,
        items: <Widget>[
          Icon(Icons.notification_important,size: 30.0,),
          Icon(Icons.timer,size: 30.0,),
        ],
        onTap: (index){
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      body:PageView(
          controller: _pageController,
          children: <Widget>[
              InstantN1(),
            ScheduledN1(),
          ],
          onPageChanged: (int index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }
      )

    );
  }

}
