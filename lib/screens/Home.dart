import 'package:flutter/material.dart';
import 'package:todo_app/screens/Menu.dart';
import 'package:todo_app/screens/TodoList.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 60, 0), child: Menu()),
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text("Todo App"),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: null,
            )
          ],
        ),
        body: TodoList(),
        floatingActionButton: FloatingActionButton(
            splashColor: Colors.purple,
            backgroundColor: Colors.purpleAccent,
            child: Icon(Icons.add),
            onPressed: null),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
