import 'dart:async';
import 'package:fastrak/setnew.dart';
import 'package:fastrak/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class PasswordOtp extends StatefulWidget {
String phone;
PasswordOtp(this.phone);
  static String routeName = "/otp";
  final value = IntTween();
@override
  _PasswordOtpState createState() => _PasswordOtpState();
}

class _PasswordOtpState extends State<PasswordOtp> {
  Timer? _timer;
  int _start = 60;
  TextEditingController phoneNumber = TextEditingController();


  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    print("omnya ${widget.phone}");
    super.initState();
    startTimer();
  }

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
        backgroundColor: Color(0xFFF9FAFF),
        leading: BackButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFF9FAFF),
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
                      'images/password.png',
                      height: 350,
                      width: 300,
                    ),
                    Text(
                      'VERIFICATION CODE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                      width: 45,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(
                        'Code Has Been Sent To '
                        "${widget.phone}"
                        'Enter The Code Below To Continue.',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "0:${_start}",
                            style: TextStyle(color: Colors.deepPurple.shade900),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              if (_start == 0) {
                                _start = 60;
                                startTimer();
                              }
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: _start == 0
                                      ? Colors.purple.shade900
                                      : Colors.purple.shade100),
                            ),
                          )
                        ],
                      ),
                    ),
                    otpField(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 55,
                        width: 500,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(left: 120.0, right: 120.0),
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 10),
                            backgroundColor: Color(0xFF4B0082),
                          ),
                          child: Text('Confirm',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SetNew()));
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpField() {
    return SizedBox(
      height: 52,
      child: OTPTextField(
        length: 5,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 50,
        style: TextStyle(
          fontSize: 17,
        ),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.box,
        onCompleted: (pin) {
          print("Completed: " + pin);
        },
      ),
    );
  }
}
