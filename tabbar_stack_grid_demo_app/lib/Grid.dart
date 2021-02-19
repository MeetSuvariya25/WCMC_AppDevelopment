import 'package:flutter/material.dart';
class Grid_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridDemo();

  }
}

class GridDemo extends StatefulWidget {
  @override
  _GridDemoState createState() => _GridDemoState();
}

class _GridDemoState extends State<GridDemo> {
  
  
  List<int> _items=new List();
  @override
  void initState() {
    for(int i=0;i<15;i++){
      _items.add(i);
    }
  }
  @override
  
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
          itemBuilder: (BuildContext context,int index){
            return new Card(
              color: Colors.red,
              child: new Padding(padding: const EdgeInsets.all(20.0)),

            );
          }
      ),
    );
  }
}
