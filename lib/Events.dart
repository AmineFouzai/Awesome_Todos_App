import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/Home.dart';
import 'package:todo_app/screens/Menu.dart';
import 'package:todo_app/server/Context.dart';

class Events extends StatefulWidget {
  Events({Key key}) : super(key: key);

  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _searchItem() {
    return null;
  }

  _addEventItem() {
    return null;
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
            onPressed: _searchItem,
          )
        ],
      ),
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
              onPressed: () {
                addToAny(context, Home());
              }),
          IconButton(
              icon: Icon(Icons.event),
              color: Colors.white,
              onPressed: _addEventItem),
          IconButton(
              icon: Icon(Icons.assignment),
              color: Colors.white,
              onPressed: _addEventItem),
        ],
      ),
    ));
  }
}
