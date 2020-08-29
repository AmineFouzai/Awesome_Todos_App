import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          Container(
              margin: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(color: Colors.purpleAccent[100]),
              child: Center(
                child: Padding(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.purpleAccent[400], fontSize: 15),
                    ),
                    padding: const EdgeInsets.all(8.0)),
              )),
          Container(
              margin: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(color: Colors.purpleAccent[100]),
              child: Center(
                child: Padding(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.purpleAccent[400], fontSize: 15),
                    ),
                    padding: const EdgeInsets.all(8.0)),
              )),
          Container(
              margin: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(color: Colors.purpleAccent[100]),
              child: Center(
                child: Padding(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.purpleAccent[400], fontSize: 15),
                    ),
                    padding: const EdgeInsets.all(8.0)),
              )),
          Container(
              margin: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(color: Colors.purpleAccent[100]),
              child: Center(
                child: Padding(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.purpleAccent[400], fontSize: 15),
                    ),
                    padding: const EdgeInsets.all(8.0)),
              )),
          Container(
              margin: const EdgeInsets.all(5),
              height: 100,
              decoration: BoxDecoration(color: Colors.purpleAccent[100]),
              child: Center(
                child: Padding(
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.purpleAccent[400], fontSize: 15),
                    ),
                    padding: const EdgeInsets.all(8.0)),
              ))
        ],
      ),
    );
  }
}
