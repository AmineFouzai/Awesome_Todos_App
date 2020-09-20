import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/Assignment.dart';
import 'package:todo_app/screens/Home.dart';
import 'package:todo_app/screens/Menu.dart';
import 'package:todo_app/server/Context.dart';

class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<String> eventsItem = events;

  var Time = new DateTime.now();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _textFieldController = TextEditingController();
  _searchItem() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Search'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Events in List"),
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
                    if (eventsItem.indexOf(_textFieldController.text) != -1) {
                      String result = eventsItem[
                          eventsItem.indexOf(_textFieldController.text)];
                      eventsItem = [];
                      eventsItem.add(result);
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

  _addEventItem() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Events'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Events in Dialog"),
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
                    eventsItem.add(_textFieldController.text);
                  });
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Widget _buildEventItem(BuildContext context) {
    return new ListView.builder(
      itemBuilder: (key, index) {
        if (index < eventsItem.length) {
          return Dismissible(
            key: Key('item ${eventsItem[index]}'),
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
                  eventsItem.removeAt(index);
                });
              } else {
                setState(() {
                  eventsItem.removeAt(index);
                });
              }
            },
            child: ListTile(
              leading: Icon(
                Icons.event,
                color: Colors.purpleAccent,
                size: 50,
              ),
              title: Text(eventsItem[index]),
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
        title: Text("Events"),
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
            onPressed: _searchItem,
          )
        ],
      ),
      body: _buildEventItem(context),
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
              icon: Icon(Icons.local_activity),
              color: Colors.white,
              onPressed: () {
                addToAny(context, Home(), todos);
              }),
          IconButton(
              icon: Icon(Icons.event),
              color: Colors.white,
              onPressed: _addEventItem),
          IconButton(
              icon: Icon(Icons.assignment),
              color: Colors.white,
              onPressed: () {
                addToAny(context, Assignment(), events);
              }),
        ],
      ),
    ));
  }
}
