import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.purpleAccent),
        child: Column(
          children: [
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  color: Colors.white,
                  tooltip: "Menu",
                  onPressed: null,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Static Todo App",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  tooltip: "Search",
                  onPressed: null,
                ),
              ],
            ),
          ],
        ));
  }
}
