import 'package:flutter/material.dart';
class Stack_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Card(color: Colors.blue,child: new Padding(padding: const EdgeInsets.all(200.0)),),
          Card(color: Colors.greenAccent,child: new Padding(padding: const EdgeInsets.all(150.0)),),
          Card(color: Colors.red,child: new Padding(padding: const EdgeInsets.all(90.0)),),
          Text('Stack Demo',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),),
        ],
      ),
    );
  }
}
