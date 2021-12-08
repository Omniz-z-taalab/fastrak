import 'dart:async';
import 'package:fastrak/WelcomeScene.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http ;
class SplashScene extends StatefulWidget {
  const SplashScene({Key? key}) : super(key: key);

  @override
  _SplashSceneState createState() => _SplashSceneState();
}

class _SplashSceneState extends State<SplashScene> {

  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => WelcomeScene()));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),


          ],
        ),
      ),
    );
  }

}
