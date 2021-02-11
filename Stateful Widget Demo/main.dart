import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stateful demo',
      theme: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        accentColor: Colors.redAccent,

      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  String data="Welcome to the Demo app";
  void _changeText(){
  setState(() {
    if(data.startsWith("W")){
      data="clicked";
    }
    else{
      data="Welcome to the Demo app";
    }

  });
  }
  Widget _bodywidget(){
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(data,style:TextStyle(fontSize: 28.0,color: Colors.blueAccent)),
            new RaisedButton(
              child: Text('Click',style: TextStyle(fontSize: 20.0,color: Colors.white),),
              onPressed: _changeText,
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Satateful Widget Demo'),
      ),
      body:_bodywidget()
    );
  }
}
