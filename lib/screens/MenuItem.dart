import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  Icon menuItemIcon;
  MenuItem({this.title, this.menuItemIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
            tooltip: this.title, icon: this.menuItemIcon, onPressed: null),
        Text(
          this.title,
          style: TextStyle(
              fontFamily: "roboto", fontSize: 20, color: Colors.purple),
        )
      ],
    ));
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
