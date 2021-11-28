import 'package:fastrak/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFF),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/Logoword.png",
                height: 100.0,
                width: 350.0,
              ),
              Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white12),
                  boxShadow: [ BoxShadow(
                color: Colors.black38.withOpacity(.02), spreadRadius: 3),
                
                  ]
                ),
                // height: 550.0,
                // width: 340,
                // decoration: new BoxDecoration(
                //   boxShadow: [
                //     //background color of box
                //     BoxShadow(
                //       color: Colors.white,
                //       blurRadius: 10, // soften the shadow
                //       spreadRadius: 10, //extend the shadow
                //       offset: Offset(
                //         20.0, // Move to right 10  horizontally
                //         1.0, // Move to bottom 10 Vertically
                //       ),
                //     )
                //   ],
                // ),
                //          margin: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 50),
                //            height: double.infinity,
                //           width: double.infinity,
                //            decoration: BoxDecoration(
                //              color: Colors.black,
                //              borderRadius: BorderRadius.only(
                //
                //              topLeft: Radius.circular(3),
                //                  topRight: Radius.circular(3),
                //                  bottomLeft: Radius.circular(3),
                //                  bottomRight: Radius.circular(3)
                //              ),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.grey.withOpacity(0.5),
                //                 spreadRadius: 5,
                //                 blurRadius: 7,
                //                 offset: Offset(0, 3), // changes position of shadow
                //               ),
                // ]),
                //           padding: EdgeInsets.only(
                //               left: 1, right: 1.0, top: 10.0, bottom: 50.0),
                //         color: Colors.white,
                //         margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/group.png',
                        height: 350,
                        width: 300,
                      ),
                      Text('SIGN IN',
                          style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 45.0,
                        height: 3.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                              width: 10,
                            ),
                            Text(
                              'Mobile Number',
                              style: TextStyle(color: Colors.black38,fontSize: 15),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 2.0, right: 2.0),
                              child: TextField(
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '+02',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.only(
                                          left: 130.0, right: 130.0),
                                      primary: Colors.white,
                                      textStyle: const TextStyle(fontSize: 6),
                                      backgroundColor: Color(0xFF4B0082)),
                                  child: Text('NEXT',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                  }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset('images/facebook.png'),
                                      SizedBox(
                                        width : 10,
                                        height: 50,
                                      ),
                                      Text(
                                        'FaceBook',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,

                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                  ),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('images/google.png'),
                                        SizedBox(
                                          width: 10,
                                          height: 50,
                                        ),
                                        Text(
                                          'Google',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(
                                          width: 45,
                                        ),

                                      ]),

                                ),
                              ],
                            )
                          ],

                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 300,
                        height: 50,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            primary: Colors.black,
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Colors.grey.shade200,
                          ),
                          child: Text('Continue As Guest', style: TextStyle(fontSize: 18.0)),
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) => SignUp()));
                          },
                        ),
                      )
                    ]),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(15),
              //     border: Border.all(color: Colors.grey, width: 1),
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       TextButton(
              //           style: TextButton.styleFrom(
              //             padding: EdgeInsets.only(left: 100.0, right: 95.0),
              //             primary: Colors.black,
              //             textStyle: const TextStyle(fontSize: 10),
              //             backgroundColor: Colors.grey,
              //           ),
              //           child: Text('Continue As Geust',
              //               style: TextStyle(
              //                   fontSize: 12.0, fontWeight: FontWeight.bold)),
              //           onPressed: () {
              //             Navigator.push(context,
              //                 MaterialPageRoute(builder: (context) => SignUp()));
              //           })
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
