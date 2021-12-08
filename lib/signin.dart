import 'package:country_picker/country_picker.dart';
import 'package:fastrak/Password.dart';
import 'package:fastrak/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SignIn extends StatefulWidget {
  // String phone;
  // SignIn({required this.phone});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String countryName = "20";
  TextEditingController _phone = TextEditingController();

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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            color: Color(0xFFF9FAFF),
            child: Container(
              padding: EdgeInsets.all(15),
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Mobile Number',
                            style: TextStyle(color: Colors.black38),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Container(
                                height: 55,
                                padding: EdgeInsets.only(
                                    right: 10.0, left: 10.0, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black38)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showCountryPicker(
                                          context: context,
                                          showPhoneCode: true,
                                          onSelect: (Country country) {
                                            print(
                                                'Select country: ${country.displayName}');
                                            setState(() {
                                              countryName = country.phoneCode;
                                            });
                                          },
                                        );
                                      },
                                      child: Container(
                                        height: 20,
                                        child: Text(
                                          '${countryName}',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black12,
                                      size: 20,
                                    ),
                                    Container(
                                      color: Colors.black38,
                                      child: SizedBox(
                                        width: 2.0,
                                        height: 20.0,
                                      ),
                                    ),


                                       Expanded(
                                              child: Container(
                                                   // color: Colors.yellow,
                                                  child: TextFormField(
                                                    controller: _phone,
                                                    inputFormatters: [
                                                      FilteringTextInputFormatter
                                                          .digitsOnly,
                                                      LengthLimitingTextInputFormatter(
                                                          10),
                                                      FilteringTextInputFormatter.allow(
                                                          RegExp(r'^[1-9][0-9]*$'))
                                                    ],
                                                    decoration: const InputDecoration(
                                                        border: InputBorder.none,
                                                        hintText: ('phone'),
                                                        contentPadding: EdgeInsets.all(13),
                                                        // border: OutlineInputBorder(),
                                                        hintStyle:
                                                            TextStyle(fontSize: 15,fontStyle: FontStyle.normal,color: Colors.black38),
                                                  ),
                                                ),
                                              ),



                                       )],
                                ),
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
                                      builder: (context) =>
                                          Inscreen(_phone.text),
                                    ),
                                  );
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
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset('images/facebook.png'),
                                    SizedBox(
                                      width: 10,
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
                                  border:
                                      Border.all(color: Colors.grey, width: 1),
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
                        child: Text('Continue As Guest',
                            style: TextStyle(fontSize: 18.0)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp(_phone.text)));
                        },
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
