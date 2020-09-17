import 'package:flutter/material.dart';
import 'package:todo_app/screens/Home.dart';

List<String> todos = ["todo example"];
List<String> events = ["event example"];
List<String> assignments = ["assignment example"];

addToAny(context, Widget child) {
  TextEditingController _textFieldController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Todo'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "todo in Dialog"),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('ADD'),
              onPressed: () {
                todos.add(_textFieldController.text);
                print(todos);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => child),
                );
              },
            )
          ],
        );
      });
}
