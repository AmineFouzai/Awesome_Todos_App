import 'package:flutter/material.dart';

class Assignment extends StatefulWidget {
  Assignment({Key key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Assignment section"),
    );
  }
}
