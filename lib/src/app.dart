import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'home.dart';
class App extends StatelessWidget {

  final Map<String, WidgetBuilder> routes= {
    '/home' : (context) => Home(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Legi',
      debugShowCheckedModeBanner: false,
      home: SplashScreen2(),
      routes: routes,
      theme: ThemeData(
        primaryColor: Colors.green[600],
        accentColor: Colors.red,
      ),
      
    );
  }
}