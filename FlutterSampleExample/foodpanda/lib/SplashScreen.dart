import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodpanda/DrawerItems.dart';
import 'package:foodpanda/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<SplashScreen>{

  @override
  void initState() {
    Timer(
        Duration(seconds: 3), () {
      Route route = MaterialPageRoute(builder: (context) => HomeScreen());
      Navigator.pushReplacement(context, route);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24),
              child: LogoImage(),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Text(
                "Uniyalas Bawarchi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = new AssetImage("images/logo.png");
    Image image = new Image(
      image: assetImage,
      color: Colors.white,
    );
    return Container(
      child: image,
      margin: EdgeInsets.fromLTRB(120, 120, 120, 0),
    );
  }
}
