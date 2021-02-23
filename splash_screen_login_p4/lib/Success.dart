import 'dart:io';

import 'package:flutter/material.dart';

class loginSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(

            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.blue])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login successful',
               style: TextStyle(
                 fontSize: 25.0,
                 color: Colors.black,
               ),
            ),
            SizedBox(height: 10.0,),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
              onPressed: (){
                exit(0);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.orangeAccent,
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
