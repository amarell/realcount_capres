import 'dart:async';
import 'package:flutter/material.dart';



class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreenState2 createState() => _SplashScreenState2();
}

class _SplashScreenState2 extends State<SplashScreen2> {
  startTime() async{
    var _duration =Duration(seconds: 2);

  return Timer(_duration, () => Navigator.of(context).pushReplacementNamed('/home'));
    
  }
  
  @override
  void initState() {
    super.initState();
    startTime();
  }
    
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Lets Giving', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),)
          ],
        )
        
      ),
    );
  }
}
