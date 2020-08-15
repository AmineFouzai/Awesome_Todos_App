import 'package:flutter/material.dart';
import 'package:todo_app/screens/TodoElements.dart';

class TodoPage extends StatefulWidget {
  TodoPage({Key key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo App")),
          backgroundColor: Colors.purpleAccent,
        ),
        body: TodoElements(),
      ),
    );
  }
}
