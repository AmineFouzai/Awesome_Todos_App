import 'package:flutter/material.dart';
import 'package:todo_app/screens/Menu.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _todoItems = [];
  var Time = new DateTime.now();

  TextEditingController _textFieldController = TextEditingController();
  _addTodoItem() {
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
                  setState(() {
                    _todoItems.add(_textFieldController.text);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildTodoItem(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (key, index) {
        if (index < _todoItems.length) {
          return Dismissible(
            key: Key('item ${_todoItems[index]}'),
            background: Container(
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.favorite, color: Colors.white),
                    Text('Move to favorites',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.delete, color: Colors.white),
                    Text('Move to trash',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  if (direction == DismissDirection.startToEnd) {
                    return AlertDialog(
                      title: const Text("Favorite Confirmation"),
                      content: const Text(
                          "Are you sure you want to add this item to Favorite?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Add")),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    );
                  } else {
                    return AlertDialog(
                      title: const Text("Delete Confirmation"),
                      content: const Text(
                          "Are you sure you want to delete this item?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("Delete")),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("Cancel"),
                        ),
                      ],
                    );
                  }
                },
              );
            },
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.startToEnd) {
                print("Add to favorite");
                setState(() {
                  //change state to push content to favoirte
                  _todoItems.removeAt(index);
                });
              } else {
                print('Remove item');
                setState(() {
                  _todoItems.removeAt(index);
                });
              }
            },
            child: ListTile(
              leading: Icon(
                Icons.local_activity,
                color: Colors.purpleAccent,
                size: 50,
              ),
              title: Text(_todoItems[index]),
              subtitle: Text(Time.toString()),
            ),
          );
        }
      },
    );
  }

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
      body: _buildTodoItem(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.purpleAccent,
          splashColor: Colors.purple,
          onPressed: _addTodoItem),
    ));
  }
}
