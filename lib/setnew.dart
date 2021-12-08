import 'package:fastrak/passwordotp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetNew extends StatefulWidget {


  const SetNew({Key? key}) : super(key: key);

  @override
  _SetNewState createState() => _SetNewState();
}
TextEditingController _phone = TextEditingController();

class _SetNewState extends State<SetNew> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color(0xFFF9FAFF)));

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          'images/Logoword.png',
          width: 250,
          height: 80,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Color(0xFFF9FAFF),

    ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white12),
                    boxShadow: [
                      BoxShadow(color: Colors.purple.shade100.withOpacity(.02), spreadRadius: 5),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/group.png',
                      height: 350,
                      width: 300,
                    ),
                    Text(
                      'ENTER YOUR PASSWORD',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: SizedBox(
                        height: 3.0,
                        width: 45.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Password',
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Password',
                                hintStyle: TextStyle(color: Colors.black38)),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Confirm New Password',
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintStyle: TextStyle(color: Colors.black38)),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                   child: SizedBox(
                      height: 55,
                      width: 700,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 50.0, right: 50.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 10),
                            backgroundColor: Color(0xFF4B0082),
                          ),
                          child: Text('Change Password',
                              style: TextStyle(
                                  fontSize: 18.0)),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
