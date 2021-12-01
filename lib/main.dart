import 'package:fastrak/SplashScene.dart';
import 'package:fastrak/passwordotp.dart';
import 'package:fastrak/setnew.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScene(),
    );
  }
}
