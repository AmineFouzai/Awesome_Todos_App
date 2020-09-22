import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/Home.dart';
import 'package:todo_app/screens/Menu.dart';
import 'package:todo_app/server/MainContext.dart';
import 'package:todo_app/screens/Events.dart';

class Assignment extends StatefulWidget {
  Assignment({Key key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  List<String> assignmentsItems = assignments;
  final Time = new DateTime.now();
  TextEditingController _textEditingController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  _searchAssignmet() {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("search"),
          content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(hintText: "Assignments in List")),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")),
            FlatButton(
                onPressed: () {
                  setState(() {
                    if (assignmentsItems.indexOf(_textEditingController.text) !=
                        -1) {
                      String result = assignmentsItems[assignmentsItems
                          .indexOf(_textEditingController.text)];
                      assignmentsItems = [];
                      assignmentsItems.add(result);
                      Navigator.of(context).pop();
                    } else {
                      Navigator.of(context).pop();
                    }
                  });
                },
                child: Text("ok"))
          ],
        ));
  }

  _addAssignment() {
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Text("Assignment"),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(hintText: "Assignment in List"),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")),
            FlatButton(
              onPressed: () {
                setState(() {
                  assignmentsItems.add(_textEditingController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            )
          ],
        ));
  }

  Widget _buildAssignmentsItem(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (key, index) {
        if (index < assignmentsItems.length) {
          return Dismissible(
            key: Key('item ${assignmentsItems[index]}'),
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
                  assignmentsItems.removeAt(index);
                });
              } else {
                setState(() {
                  assignmentsItems.removeAt(index);
                });
              }
            },
            child: ListTile(
              leading: Icon(
                Icons.assignment,
                color: Colors.purpleAccent,
                size: 50,
              ),
              title: Text(assignmentsItems[index]),
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
        key: _scaffoldkey,
        drawer: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          child: Menu(),
        ),
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text("Assignments"),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 8),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                _scaffoldkey.currentState.openDrawer();
              }),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: _searchAssignmet,
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
        body: _buildAssignmentsItem(context),
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
                icon: Icon(
                  Icons.local_activity,
                  color: Colors.white,
                ),
                onPressed: () {
                  addToAny(context, Home(), todos);
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.event,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    addToAny(context, Events(), events);
                  }),
              IconButton(
                icon: Icon(
                  Icons.assignment,
                  color: Colors.white,
                ),
                onPressed: _addAssignment,
              )
            ]),
      ),
    );
  }
}
