import 'package:carousel_slider/carousel_slider.dart';
import 'package:fastrak/signin.dart';
import 'package:fastrak/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScene extends StatefulWidget {
  const WelcomeScene({Key? key}) : super(key: key);

  @override
  _WelcomeSceneState createState() => _WelcomeSceneState();
}

class _WelcomeSceneState extends State<WelcomeScene> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image.asset(
          "images/Logoword.png",
          height: 90.0,
          width: 350.0,
        ),
        Expanded(
          child: Container(
            color: Color(0xFFF9FAFF),
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: PageView(
              controller: _controller,
              children: <Widget>[
                page('images/Group 7627.png', "User-friendly",
                    "From registering an account with Fastrak to tracking your parcel, we ensure a friendly and easy-to-use application."),
                page('images/Group 7627.png', "User-friendly",
                    "From registering an account with Fastrak to tracking your parcel, we ensure a friendly and easy-to-use application."),
                page('images/Group 7627.png', "Hello",
                    "From registering an account with Fastrak to tracking your parcel, we ensure a friendly and easy-to-use application."),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        SmoothPageIndicator(controller: _controller, count: 3, effect: SwapEffect(
            activeDotColor: Color(0xFF4B0082), dotHeight: 8, dotWidth: 8,
            spacing: 10
        ) ,),

        SizedBox(
          height: 40,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),

          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              primary: Colors.deepPurple,
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: Colors.purple.shade50,
            ),
            child: Text('Skip', style: TextStyle(fontSize: 15.0)),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
          ),

        ),

        SizedBox(
          height: 25,
        ),
      ],
    )));
  }

  Widget page(String image, String title, String subTitle) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white12),
          boxShadow: [ BoxShadow(
      color: Colors.black38.withOpacity(.02), spreadRadius: 3),

          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: 350,
            width: 300,
          ),
          Text(title,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Text(
            subTitle,
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
