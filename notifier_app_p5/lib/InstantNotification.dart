
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart';



class InstantN1 extends StatefulWidget {
  @override
  _InstantN1State createState() => _InstantN1State();
}

class _InstantN1State extends State<InstantN1> {
  FlutterLocalNotificationsPlugin fltrNotification;
  TextEditingController txttitle=new TextEditingController();
  TextEditingController txtmsg=new TextEditingController();
  @override
  void initState() {
    super.initState();

    var androidInitilize = new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings);
  }
  Future _showNotification(String t,String m) async {
    var androidDetails = new AndroidNotificationDetails(
        "Meet Suvariya", "18IT132", "This is my practical",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);
    if(t.length==0){
      t="Notification";
    }
    if(m.length==0){
      m="Hello this is Meet.";
    }
    await fltrNotification.show(0, t,m, generalNotificationDetails, payload: "Task");
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
              "Instant Notification",
              style: TextStyle(
                fontSize: 35.0,
                color: Colors.white70,
                fontWeight: FontWeight.w700,

              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.all(20),
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
              padding: EdgeInsets.all(20),
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
            SizedBox(
              width: 300,
              height: 60,
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                onPressed: (){
                  setState(() {
                    _showNotification(txttitle.text, txtmsg.text);
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
