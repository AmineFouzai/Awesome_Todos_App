import "package:flutter/material.dart";

class SettingsSection extends StatefulWidget {
  final String sectionTitle;
  final Icon sectionIcon;
  SettingsSection({this.sectionTitle, this.sectionIcon});

  @override
  _SettingsSectionState createState() => _SettingsSectionState();
}

Widget Hr() {
  return SizedBox(
      width: 10,
      height: 1.5,
      child: Container(
        color: Colors.purple[400],
      ));
}

class _SettingsSectionState extends State<SettingsSection> {
  _actionRouter(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Text("in development")));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Container(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.77,
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  widget.sectionIcon,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.sectionTitle,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              )),
        ),
        GestureDetector(
            onTap: () {
              _actionRouter(context);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.purpleAccent,
                    ),
                  )
                ],
              ),
            ))
      ],
    ));
  }
}
