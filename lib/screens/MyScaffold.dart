import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:todo_app/screens/MyAppBar.dart";

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 23, 0, 0),
      child: Material(
        child: Column(
          children: <Widget>[
            MyAppBar(
              title: Text(
                "Example of text",
                style: Theme.of(context).primaryTextTheme.headline6,
              ),
            ),
            Expanded(
              child: Center(
                child: Text("hello ,world!",
                    style: TextStyle(
                      color: Colors.black,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: FloatingActionButton.extended(
                  icon: Icon(Icons.add_alert),
                  onPressed: () {
                    return CupertinoAlertDialog(
                      title: Text('alert'),
                      content: Text('alert example'),
                    );
                  },
                  label: Text("Alert")),
            ),
          ],
        ),
      ),
    );
  }
}
