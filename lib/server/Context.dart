import 'package:flutter/material.dart';

List<String> todos = ["todo example"];
List<String> events = ["event example"];
List<String> assignments = ["assignment example"];

addToAny(context, Widget child, items) {
  TextEditingController _textFieldController = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Item'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "Item in Dialog"),
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
                items.add(_textFieldController.text);
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
