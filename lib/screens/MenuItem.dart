import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  Icon menuItemIcon;
  MenuItem({this.menuItemIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(icon: this.menuItemIcon, onPressed: null));
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
