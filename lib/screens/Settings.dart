import 'package:flutter/material.dart';
import 'package:todo_app/screens/Actions.dart';
import 'package:todo_app/screens/Home.dart';
import 'package:todo_app/screens/Menu.dart';

class Settings extends StatefulWidget {
  Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          key: _scaffoldkey,
          drawer: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: Menu(),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("Settings"),
            backgroundColor: Colors.purpleAccent,
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 8),
              child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _scaffoldkey.currentState.openDrawer();
                  }),
            ),
          ),
          body: SettingsActions(),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.purpleAccent,
              child: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              })),
    );
  }
}
