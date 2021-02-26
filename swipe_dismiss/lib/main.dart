import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiperDismiss Demo',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final List<String> items=new List<String>.generate(30, (i) => "Item: ${i+1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SwiperDismiss'),),
      body:ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,int index){
          return Dismissible(
            key: new Key(items[index]),
            onDismissed: (direction){
              items.removeAt(index);
              Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Item Deleted")));
            },
            background: new Container(
              color: Colors.red,
              child: Icon(Icons.delete),
            ),
            child: new ListTile(
              title: Text("${items[index]}"),
            ),
          );
        },
      )

    );
  }
}


