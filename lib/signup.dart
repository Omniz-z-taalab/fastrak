import 'package:country_picker/country_picker.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:country_code/country_code.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Boolean value
  bool _value = false;
  final List _allActivities = ['+1', '+91'];
  String _activity = '+1';

  @override
  Widget build(BuildContext context) {

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
                        color: Colors.black38.withOpacity(.02), spreadRadius: 3),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 30.0,
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
                    onTap: () {
                      void requestPermission() async {
                        var status = await Permission.camera.status;
                        if (!status.isGranted) {
                          await Permission.camera.request();
                        }
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
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/camera.png'),
                            Text(
                              'profile photo',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.deepPurple),
                            ),
                          ]),
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
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'First Name',
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Text(
                            'EmailAddress',
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          TextField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'user_name@gmail.com',
                                hintStyle: TextStyle(color: Colors.black)),
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
                              padding: EdgeInsets.only(
                                  right: 10.0, left: 10.0, top: 18, bottom: 18),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black38)),
                              child: InkWell(
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true,
                                    // optional. Shows phone code before the country name.
                                    onSelect: (Country country) {
                                      print(
                                          'Select country: ${country.displayName}');
                                    },
                                  );
                                  showCountryPicker(
                                    context: context,
                                    exclude: <String>['KN', 'MF'],
                                    //It takes a list of country code(iso2).
                                    onSelect: (Country country) => print(
                                        'Select country: ${country.displayName}'),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      '+0',
                                    ),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black38,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Company Name',
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          TextField(
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
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          TextField(
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
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                          ),
                          TextField(
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
                              Text(
                                'I agree to the',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                'terms&conditions',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4B0082)),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
