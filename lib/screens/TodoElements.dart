import 'package:flutter/material.dart';

class TodoElements extends StatefulWidget {
  TodoElements({Key key}) : super(key: key);

  @override
  _TodoElementsState createState() => _TodoElementsState();
}

class _TodoElementsState extends State<TodoElements> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
        child: ListTile(
      title: Text("Todo Text"),
    ));
  }
}
