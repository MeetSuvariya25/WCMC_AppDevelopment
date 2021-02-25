import 'package:flutter/material.dart';

class DialogScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDemo();
  }
}
class AlertDemo extends StatefulWidget {
  @override
  _AlertDemoState createState() => _AlertDemoState();
}

class _AlertDemoState extends State<AlertDemo> {

  void dialog(){
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Warning'),
        content: Text('This is demo for Alert Dialog.'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: (){Navigator.pop(context);})
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Dialog Demo'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('DialogBox'),
          color: Colors.deepPurple,
          onPressed: (){
            dialog();
          },
        ),
      ),
    );
  }
}
