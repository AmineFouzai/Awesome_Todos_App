import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo_app/screens/User.dart';

Stopwatch excTime = new Stopwatch()..start();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          title: Text(
            'Welcome ,To Awsome Todos',
            style: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 20.0),
          ),
          image: Image.asset("images/push-pin.png"),
          seconds: 3,
          loaderColor: Colors.purpleAccent,
          navigateAfterSeconds: User(),
        ));
  }
}
