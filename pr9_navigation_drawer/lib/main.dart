import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}
List<CustomPopupMenu> choices = <CustomPopupMenu>[
  CustomPopupMenu(
    title: 'Home',
    icon: Icons.home,
  ),
  CustomPopupMenu(
    title: 'Bookmarks',
    icon: Icons.bookmark,
  ),
  CustomPopupMenu(
    title: 'Settings',
    icon: Icons.settings,
  ),
];

class _HomepageState extends State<Homepage> {
  CustomPopupMenu _selectedChoices = choices[0];
  void _select(CustomPopupMenu choice) {
    setState(() {
      _selectedChoices = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer" ,),
        backgroundColor: Colors.red,
        actions: <Widget>[
          PopupMenuButton<CustomPopupMenu>(
            child: Icon(
              Icons.more_vert,
            ),
            elevation: 3.2,
            onCanceled: () {
              print('You have not chossed anything');
            },
            tooltip: 'This is tooltip',
            onSelected: _select,
            itemBuilder: (BuildContext context) {
              return choices.map((CustomPopupMenu choice) {
                return PopupMenuItem<CustomPopupMenu>(
                  value: choice,
                  child: Text(choice.title),
                );
              }).toList();
            },
          )
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Meet Suvariya"),
              accountEmail: Text("18it132@charusat.edu.in"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(
                  "M",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text("Account"),
              trailing: Icon(Icons.account_balance),
            ),
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.logout),
            ),
          ],
        ),
      ),


    );
  }
}
class CustomPopupMenu {
  CustomPopupMenu({
    this.title,
    this.icon,
  });
  String title;
  IconData icon;
}
