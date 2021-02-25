import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Dialog_demo.dart';
import 'Snackbar_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo Application'),),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: Text('Meet Suvariya'),
                accountEmail: Text('meetsuvariya@gmail.com'),
                currentAccountPicture: new CircleAvatar(backgroundColor: Colors.black26,child: Text('M',style: TextStyle(fontSize: 20.0),),),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            new ListTile(title: Text('SnackBar Demo'),trailing: Icon(Icons.all_inclusive_outlined),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SnackBarScreen()));
            },),
            new ListTile(title: Text('Dialog Demo'),trailing: Icon(Icons.notification_important),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DialogScreen()));
            },),
          ],
        ),
      ),
    );
  }
}

