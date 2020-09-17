import 'package:flutter/material.dart';
import 'package:todo_app/screens/Home.dart';
import 'package:todo_app/screens/Events.dart';
import 'package:todo_app/screens/Assignment.dart';
import 'package:todo_app/screens/Settings.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  final String toolTip;
  Icon menuItemIcon;
  MenuItem({this.toolTip, this.menuItemIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            icon: this.menuItemIcon,
            onPressed: () {
              if (this.toolTip == "Home") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } else if (this.toolTip == "Events") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Events()),
                );
              } else if (this.toolTip == "Assignment") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Assignment()),
                );
              } else if (this.toolTip == "Settings") {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              }
            }));
  }
}

// Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                                 tooltip: "Home",
//                                 icon: Icon(Icons.home),
//                                 onPressed: null),
//                             Text("Home")
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                                 tooltip: "Follow",
//                                 icon: Icon(Icons.group_add),
//                                 onPressed: null),
//                             Text("My Events")
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                                 tooltip: "Tasks",
//                                 icon: Icon(Icons.group_add),
//                                 onPressed: null),
//                             Text("Tasks")
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                                 tooltip: "Settings",
//                                 icon: Icon(Icons.group_add),
//                                 onPressed: null),
//                             Text("Settings")
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: <Widget>[
//                             IconButton(
//                                 tooltip: "About",
//                                 icon: Icon(Icons.group_add),
//                                 onPressed: null),
//                             Text("About")
//                           ],
//                         )
