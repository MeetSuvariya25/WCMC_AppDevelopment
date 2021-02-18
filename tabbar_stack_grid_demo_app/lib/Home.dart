import 'package:flutter/material.dart';
class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Tabbar Info',style: TextStyle(fontSize: 30.0,color: Colors.blue),),
            SizedBox(
              height: 10.0,
            ),
            Text('We can add Tabbar in two way. First at the top of the screen and second is at the bottom of the screen.'
                ' We can use bottom attribute of appbar property to set the tabbar at the top of the screen.'
                'we can use bottomNavigationBar attribute of Scaffold  to set the tabbar at the bottom of the screen.',
              style: TextStyle(fontSize: 18.0,),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
