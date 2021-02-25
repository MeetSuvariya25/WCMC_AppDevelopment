import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _skey=new GlobalKey<ScaffoldState>();
  void method1(){

    // ignore: deprecated_member_use
    _skey.currentState.showSnackBar(new SnackBar(content: Text('SnackBar Activated')));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _skey,
      appBar: AppBar(
        title: Text('SnackBar Demo'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Activate SnackBar'),
          color: Colors.deepPurple,
          onPressed: (){
            method1();
          },
        ),
      ),
    );
  }
}
