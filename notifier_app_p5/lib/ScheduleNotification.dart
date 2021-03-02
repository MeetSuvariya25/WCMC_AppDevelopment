import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class ScheduledN1 extends StatefulWidget {
  @override
  _ScheduledN1State createState() => _ScheduledN1State();
}

class _ScheduledN1State extends State<ScheduledN1> {
  FlutterLocalNotificationsPlugin fltrNotification;
  TextEditingController txttitle=new TextEditingController();
  TextEditingController txtmsg=new TextEditingController();
  String _selectedParam;
  int val;

  @override
  void initState() {
    super.initState();

    var androidInitilize = new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings);
  }

  Future _showNotification(String t,String m) async {
    var androidDetails = new AndroidNotificationDetails("Meet Suvariya", "18IT132", "This is my practical",importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);
    if(t.length==0){
      t="Notification";
    }
    if(m.length==0){
      m="Hello this is Meet.";
    }
    var scheduledTime;
    if (_selectedParam == "Hour") {
      scheduledTime = DateTime.now().add(Duration(hours: val));
    } else if (_selectedParam == "Minute") {
      scheduledTime = DateTime.now().add(Duration(minutes: val));
    } else {
      scheduledTime = DateTime.now().add(Duration(seconds: val));
    }

    fltrNotification.schedule(1, t, m, scheduledTime, generalNotificationDetails);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Scheduled Notification",
              style: TextStyle(
                fontSize: 33.0,
                color: Colors.white70,
                fontWeight: FontWeight.w700,

              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: new TextField(
                controller: txttitle,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.title,color: Colors.white,),
                  labelText: "Title",
                  labelStyle: TextStyle(
                      color:Colors.white,
                      fontSize: 20.0
                  ),
                  hintText: "Enter Title",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: new TextField(
                controller: txtmsg,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                ),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  prefixIcon: Icon(Icons.message,color: Colors.white,),
                  labelText: "Message",
                  labelStyle: TextStyle(
                      color:Colors.white,
                      fontSize: 20.0
                  ),
                  hintText: "Enter Message",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: _selectedParam,
                  items: [
                    DropdownMenuItem(
                      child: Text("Seconds"),
                      value: "Seconds",
                    ),
                    DropdownMenuItem(
                      child: Text("Minutes"),
                      value: "Minutes",
                    ),
                    DropdownMenuItem(
                      child: Text("Hour"),
                      value: "Hour",
                    ),
                  ],
                  hint: Text(
                    "Select Your Field.",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (_val) {
                    setState(() {
                      _selectedParam = _val;
                    });
                  },
                ),
                DropdownButton(
                  value: val,
                  items: [
                    DropdownMenuItem(
                      child: Text("1"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: 4,
                    ),
                  ],
                  hint: Text(
                    "Select Value",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onChanged: (_val) {
                    setState(() {
                      val = _val;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                onPressed: (){
                  setState(() {
                    _showNotification(txttitle.text,txtmsg.text);
                  });
                },
                elevation: 20,
                child:Text('Send Notification',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),),
                color: Colors.indigo,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
