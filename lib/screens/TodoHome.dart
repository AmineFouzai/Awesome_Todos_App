import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todoListItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          backgroundColor: Colors.purpleAccent,
        ),
        drawer: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
          child: Drawer(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: <Widget>[
                  Icon(
                    Icons.school,
                    color: Colors.purpleAccent,
                    size: 200,
                  ),
                  Text(
                    "Home",
                    textScaleFactor: 2,
                  ),
                  Text(
                    "Github",
                    textScaleFactor: 2,
                  ),
                  Text(
                    "Facebook",
                    textScaleFactor: 2,
                  ),
                  Text(
                    "Twitter",
                    textScaleFactor: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ButtonTheme(
              minWidth: 100,
              height: 100,
              child: FloatingActionButton.extended(
                  splashColor: Colors.deepPurple,
                  backgroundColor: Colors.purpleAccent,
                  onPressed: () => print('pressed'),
                  label: Text("add")),
            ),
          ),
        ));
  }
}

// class TodoList extends StatefulWidget {
//   @override
//   createState() => new TodoListState();
// }

// class TodoListState extends State<TodoList> {
//   List<String> _todoItems = [];

//   // This will be called each time the + button is pressed
//   void _addTodoItem() {
//     // Putting our code inside "setState" tells the app that our state has changed, and
//     // it will automatically re-render the list
//     setState(() {
//       int index = _todoItems.length;
//       _todoItems.add('Todo Item ' + index.toString());
//     });
//   }

//   // Build the whole list of todo items
//   Widget _buildTodoList() {
//     return new ListView.builder(
//       itemBuilder: (context, index) {
//         // itemBuilder will be automatically be called as many times as it takes for the
//         // list to fill up its available space, which is most likely more than the
//         // number of todo items we have. So, we need to check the index is OK.
//         if (index < _todoItems.length) {
//           return Dismissible(
//             key: Key('item ${_todoItems[index]}'),
//             background: Container(
//               color: Colors.blue,
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Row(
//                   children: <Widget>[
//                     Icon(Icons.favorite, color: Colors.white),
//                     Text('Move to favorites',
//                         style: TextStyle(color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ),
//             secondaryBackground: Container(
//               color: Colors.red,
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     Icon(Icons.delete, color: Colors.white),
//                     Text('Move to trash',
//                         style: TextStyle(color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ),
//             confirmDismiss: (DismissDirection direction) async {
//               return await showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: const Text("Delete Confirmation"),
//                     content: const Text(
//                         "Are you sure you want to delete this item?"),
//                     actions: <Widget>[
//                       FlatButton(
//                           onPressed: () => Navigator.of(context).pop(true),
//                           child: const Text("Delete")),
//                       FlatButton(
//                         onPressed: () => Navigator.of(context).pop(false),
//                         child: const Text("Cancel"),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             onDismissed: (DismissDirection direction) {
//               if (direction == DismissDirection.startToEnd) {
//                 print("Add to favorite");
//               } else {
//                 print('Remove item');
//               }

//               setState(() {
//                 _todoItems.removeAt(index);
//               });
//             },
//             child: ListTile(
//               leading: Icon(
//                 Icons.local_activity,
//                 size: 50,
//               ),
//               title: Text(_todoItems[index]),
//               subtitle: Text("Description text"),
//             ),
//           );
//         }
//       },
//     );
//   }

//   // Build a single todo item
//   Widget _buildTodoItem(String todoText) {
//     return new ListTile(title: new Text(todoText));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text('Todo List')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: _buildTodoList(),
//       ),
//       floatingActionButton: new FloatingActionButton(
//           onPressed: _addTodoItem,
//           tooltip: 'Add task',
//           child: new Icon(Icons.add)),
//     );
//   }
// }