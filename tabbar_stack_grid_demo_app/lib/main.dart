import 'package:flutter/material.dart';
import 'package:tabbar_stack_grid_demo_app/Home.dart';
import 'package:tabbar_stack_grid_demo_app/Stack.dart';
import 'package:tabbar_stack_grid_demo_app/Grid.dart';

void main(){
  return runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabbar Demo App',
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
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text('Tabbar DemoApp'),
          bottom: new TabBar(

            tabs: <Widget>[
              new Icon(Icons.home),
              new Icon(Icons.view_stream_rounded),
              new Icon(Icons.grid_on),
            ],
          ),
        ),
        body:TabBarView(
          children: <Widget>[
            Home_Screen(),
            Stack_Screen(),
            Grid_Screen(),
          ],
        ),

      ),
    );
  }
}

