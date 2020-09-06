import "package:flutter/material.dart";
import 'package:todo_app/screens/MenuItem.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
              color: Colors.purpleAccent,
              child: DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.purple,
                    size: 120,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MenuItem(
                    title: "Home",
                    menuItemIcon: Icon(
                      Icons.home,
                      color: Colors.purple,
                    ),
                  ),
                  MenuItem(
                    title: "Events",
                    menuItemIcon: Icon(
                      Icons.event,
                      color: Colors.purple,
                    ),
                  ),
                  MenuItem(
                    title: "Task",
                    menuItemIcon: Icon(
                      Icons.assignment,
                      color: Colors.purple,
                    ),
                  ),
                  MenuItem(
                    title: "Settings",
                    menuItemIcon: Icon(
                      Icons.settings,
                      color: Colors.purple,
                    ),
                  ),
                  MenuItem(
                    title: "About",
                    menuItemIcon: Icon(
                      Icons.chrome_reader_mode,
                      color: Colors.purple,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  Drawer(
//             child: Container(
//               padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(
//                     Icons.school,
//                     color: Colors.purpleAccent,
//                     size: 200,
//                   ),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         MenuItem(
//                           title: "Home",
//                           menuItemIcon: Icon(Icons.home),
//                         ),
//                         MenuItem(
//                           title: "Events",
//                           menuItemIcon: Icon(Icons.event),
//                         ),
//                         MenuItem(
//                           title: "Task",
//                           menuItemIcon: Icon(Icons.account_box),
//                         ),
//                         MenuItem(
//                           title: "Home",
//                           menuItemIcon: Icon(Icons.home),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
