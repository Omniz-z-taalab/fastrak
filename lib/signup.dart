import 'dart:convert';
import 'dart:io';
import 'package:form_validator/form_validator.dart';
import 'package:country_picker/country_picker.dart';
import 'package:fastrak/APIS/model/register.api.dart';
import 'package:fastrak/Password.dart';
import 'package:fastrak/passwordotp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  String phone;

  SignUp(this.phone);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController passowrd = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formdKey = GlobalKey<FormState>();
  bool _value = false;
  final List _allActivities = ['+1', '+91'];
  String _activity = '+1';
  String countryName = "20";

  postData() async {
    var response = await http.post(
        Uri.parse(
            "http://3.126.221.243:8080/api/v1/user/auth/regular/register"),
        headers: {
          HttpHeaders.acceptHeader: "application/json"
        },
        body: {
          "first_name": firstName.text,
          "last_name": lastName.text,
          "phone": phoneNumber.text,
          "email": email.text,
          "company": company.text,
          "password": passowrd.text,
          "confirmPassword": confirmPassword.text,
        });

    print(response.body);
    if (response.statusCode == 200) {
      Register model = Register.fromJson(jsonDecode(response.body)['data']);
      var data = jsonDecode(response.body);
      List<Register> allPersons = [];
      for (var u in data) {
        Register person = Register.fromJson(u);
      }
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PasswordOtp(widget.phone)));
    } else {
      throw Exception("error");
    }
  }

  late List<Register>? users;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.phone != null) {
        phoneNumber.text = widget.phone;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xFFF9FAFF)));

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
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(color: Colors.black38),
              ]),
          child: Container(
            color: Color(0xFFF9FAFF),
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.purple.shade100.withOpacity(.02),
                        spreadRadius: 5),
                  ]),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Text('SIGN UP',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 40.0,
                  height: 3.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    var status = await Permission.camera.status;
                    if (!status.isGranted) {
                      await Permission.camera.request();
                    }
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: Colors.purple.shade50, width: 12)),
                    child: Form(
                      key: _formdKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/camera.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'profile photo',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.deepPurple),
                            ),
                          ]),
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'First Name',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        TextFormField(
                          controller: firstName,
                          decoration: InputDecoration(labelText: "first Name"),
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        // TextField(
                        //   decoration: const InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       hintText: 'First Name',
                        //       hintStyle: TextStyle(color: Colors.black)),

                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'Last Name',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        TextFormField(
                          controller: lastName,
                          decoration: InputDecoration(labelText: "Last Name"),
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'Please enter text';
                            }
                            return null;
                          },
                        ),

                        // TextField(
                        //   decoration: const InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       hintText: 'Last Name',
                        //       hintStyle: TextStyle(color: Colors.black)),
                        // ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          'EmailAddress',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        // TextField(
                        //   decoration: const InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       hintText: 'user_name@gmail.com',
                        //       hintStyle: TextStyle(color: Colors.black)),
                        // ),
                        TextFormField(
                          controller: email,
                          decoration:
                              InputDecoration(labelText: "EmailAddress"),
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
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
                          child: Container(
                            height: 55,
                            padding: EdgeInsets.only(
                                right: 10.0, left: 10.0, top: 10, bottom: 10),
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
                                SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      // color: Colors.yellow,
                                      padding: EdgeInsets.all(2),
                                      child: TextFormField(
                                        controller: phoneNumber,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(10),
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'^[1-9][0-9]*$'))
                                        ],
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: ('phone'),
                                            contentPadding: EdgeInsets.all(9),
                                            hintStyle: TextStyle(fontSize: 15)),
                                        validator: (value) {
                                          if (value == null || value!.isEmpty) {
                                            return 'Please enter number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Company Name',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        TextFormField(
                          controller: company,
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'Please enter text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Company Name',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        TextFormField(
                          controller: passowrd,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter text';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),

                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Confirm Password',
                          style: TextStyle(color: Colors.black38, fontSize: 15),
                        ),
                        TextFormField(
                          controller: confirmPassword,
                          validator: (value) {
                            if (value == null || value!.isEmpty) {
                              return 'Please confirm password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        // Checkbox(value: value, onChanged: onChanged)

                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _value = !_value;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.zero,
                                  child: _value
                                      ? Icon(
                                          Icons.check,
                                          size: 30.0,
                                          color: Colors.deepPurple,
                                        )
                                      : Icon(
                                          Icons.check_box_outline_blank,
                                          size: 30.0,
                                          color: Colors.deepPurple,
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                              width: 95,
                              child: Text(
                                'I agree to the',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 5, top: 5),
                              child: Text(
                                'Terms & Conditions',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFF4B0082)),
                              ),
                            )
                          ],
                        ),
                      ]),
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
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        var _formKey;
                        if (_formKey.currentState!.validate()) {
                            // postData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PasswordOtp(widget.phone)));
                        }
                      }),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(value);
  }
}

bool isLastNameValid(String? lastName) => isLastNameValid(lastName);

bool isFirastNameValid(String? firstName) => isFirastNameValid(firstName);
