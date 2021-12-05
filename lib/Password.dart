import 'package:fastrak/passwordotp.dart';
import 'package:fastrak/setnew.dart';
import 'package:flutter/material.dart';

class Inscreen extends StatefulWidget {
String phone;
Inscreen(this.phone);
  @override
  _InscreenState createState() => _InscreenState();
}

class _InscreenState extends State<Inscreen> {
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF9FAFF),
      ),
      backgroundColor: Color(0xFFF9FAFF),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38.withOpacity(.02),
                        spreadRadius: 3),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/group.png',
                    height: 350,
                    width: 300,
                  ),
                  Text('ENTER YOUR PASSWORD',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 45.0,
                    height: 4.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 52,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          labelText: 'Password',
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepPurple.shade500,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PasswordOtp(_phone.text)));
                              });
                            }),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 52,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Color(0xFF4B0082),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    // child: SizedBox(
                    //   height: 52,
                    //   width: 500,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 120.0, right: 120.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 10),
                          backgroundColor: Color(0xFF4B0082),
                        ),
                        // backgroundColor: Colors.transparent),
                        child: Container(
                          child:
                              Text('Sign In', style: TextStyle(fontSize: 18.0)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordOtp(_phone.text)));
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade300,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.only(left: 50.0, right: 50.0),
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 10),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text('Continue As Driver',
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.black)),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordOtp(_phone.text)));
                        }),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
