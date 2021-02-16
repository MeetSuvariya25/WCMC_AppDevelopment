import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  var sum=null;
  final aControl=new TextEditingController();
  final bControl=new TextEditingController();
  void _onclick(){
    setState(() {
      if(aControl.text!=null || bControl.text!=null){
        final val1=num.tryParse(aControl.text);
        final val2=num.tryParse(bControl.text);

        if(val1!=null && val2!=null){
          sum=val1+val2;
          Fluttertoast.showToast(
            msg: 'Sum of two number : ${sum}',
            gravity: ToastGravity.BOTTOM,
            fontSize: 20.0,
          );
        }
        else{
          Fluttertoast.showToast(
            msg: 'Enter numeric values only',
            gravity: ToastGravity.BOTTOM,
            fontSize: 20.0,
          );
        }
      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('Adition App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

                Text('Addition of Two number',style: TextStyle(fontSize: 25.0),),
                SizedBox(height: 50,),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: aControl,
                  decoration: InputDecoration(
                    hintText: 'Enter 1st number',
                  ),
                ),
              SizedBox(height: 30,),
              TextField(
                keyboardType: TextInputType.number,
                controller: bControl,
                decoration: InputDecoration(
                  hintText: 'Enter 2nd number',
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(
                child:Text('Add',style: TextStyle(fontSize: 20.0),),
                onPressed: _onclick,
              ),
              SizedBox(height: 30.0,),
              Text('18IT132-Suvariya Meet',style: TextStyle(fontSize: 20.0,color:Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}



