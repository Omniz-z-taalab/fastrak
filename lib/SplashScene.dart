import 'dart:async';
import 'dart:convert';
import 'package:fastrak/APIS/model/Update.dart';
import 'package:fastrak/WelcomeScene.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:launch_review/launch_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScene extends StatefulWidget {
  const SplashScene({Key? key}) : super(key: key);

  @override
  _SplashSceneState createState() => _SplashSceneState();
}

class _SplashSceneState extends State<SplashScene> {
  Future<Update?> getUpdate() async {
    var response = await http.get(Uri.parse(
        "http://3.126.221.243:8080/api/v1/configuration/latest-version?platform=ios&app_type=1&version=0.0.2)"));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      Update model = Update.fromJson(jsonDecode(response.body)['data']);
      if (model.hasUpdate == false) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => WelcomeScene()));
      } else {
        _launchURL();
      }
    }
  }

  _launchURL() async {
    const url = "https://play.google.com/store/apps/details?id=" +
        "com.example.fastrak";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // throw 'Could not launch $url';
      throw Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => WelcomeScene()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      getUpdate();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.deepPurple));
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/logo.png'),
            ],
          ),
        ));
  }
}
