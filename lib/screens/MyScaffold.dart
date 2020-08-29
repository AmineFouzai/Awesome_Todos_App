import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/MyAppBar.dart';
import 'package:todo_app/screens/MyTodoList.dart';

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
              child: Center(child: TodoList()),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: FloatingActionButton.extended(
                  icon: Icon(Icons.add),
                  splashColor: Colors.deepPurple,
                  onPressed: () => print("pressed"),
                  backgroundColor: Colors.purpleAccent,
                  label: Text("Add")),
            ),
          ],
        ),
      ),
    );
  }
}
