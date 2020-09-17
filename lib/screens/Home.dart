import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/gestures.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _textFieldController = TextEditingController();

  _SearchItem() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Search'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "todo in List"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('ok'),
                onPressed: () {
                  setState(() {
                    //_textFieldController.text
                    if (_todoItems.indexOf(_textFieldController.text) != -1) {
                      String result = _todoItems[
                          _todoItems.indexOf(_textFieldController.text)];
                      _todoItems = [];
                      _todoItems.add(result);
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                    }
                  });
                },
              )
            ],
          );
        });
  }

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
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.delete, color: Colors.white),
                    Text('Move to trash',
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
                },
              );
            },
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  _todoItems.removeAt(index);
                });
              } else {
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
      key: _scaffoldKey,
      // endDrawerEnableOpenDragGesture: false,
      // drawerEnableOpenDragGesture: false,
      drawer: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          // color: Colors.white,
          // padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
          child: Menu()),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          padding: EdgeInsets.fromLTRB(30, 0, 0, 8),
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
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
            onPressed: _SearchItem,
          )
        ],
      ),
      body: _buildTodoItem(context),
      floatingActionButton: FabCircularMenu(
        fabOpenIcon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        fabCloseIcon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        fabColor: Colors.purpleAccent,
        fabSize: 60,
        ringWidth: 50,
        ringColor: Colors.purpleAccent,
        ringDiameter: MediaQuery.of(context).size.width * 0.75,
        fabOpenColor: Colors.purpleAccent,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: _addTodoItem),
          IconButton(
              icon: Icon(Icons.event),
              color: Colors.white,
              onPressed: _addTodoItem),
          IconButton(
              icon: Icon(Icons.assignment),
              color: Colors.white,
              onPressed: _addTodoItem),
        ],
      ),
    ));
  }
}
