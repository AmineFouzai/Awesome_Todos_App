import 'package:flutter/material.dart';
import 'package:todo_app/screens/SettingsSection.dart';

class SettingsActions extends StatefulWidget {
  SettingsActions({Key key}) : super(key: key);

  @override
  _SettingsActionsState createState() => _SettingsActionsState();
}

class _SettingsActionsState extends State<SettingsActions> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        SettingsSection(
          sectionTitle: "User Settings",
          sectionIcon: Icon(Icons.account_box, color: Colors.purpleAccent),
        ),
        Hr(),
        SettingsSection(
          sectionTitle: "Todos Settings",
          sectionIcon: Icon(Icons.local_activity, color: Colors.purpleAccent),
        ),
        Hr(),
        SettingsSection(
          sectionTitle: "Events Settings",
          sectionIcon: Icon(Icons.event, color: Colors.purpleAccent),
        ),
        Hr(),
        SettingsSection(
          sectionTitle: "Assignments Settings",
          sectionIcon: Icon(Icons.event, color: Colors.purpleAccent),
        ),
        Hr()
      ],
    ));
  }
}
