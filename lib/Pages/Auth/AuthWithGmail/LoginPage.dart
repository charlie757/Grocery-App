import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:online_shopping/Pages/Auth/AuthWithGmail/reset.dart';
import 'package:online_shopping/Pages/Auth/AuthWithGoogle/GoogleAuth.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'Signup.dart';
import 'authService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  final formKey = new GlobalKey<FormState>();

  String email, password;

  Color greenColor = Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm())));
  }

  _buildLoginForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          SizedBox(height: 75.0),
          Container(
              // height: 125.0,
              // width: 200.0,
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shimmer.fromColors(
              //     baseColor: Colors.cyan,
              //     highlightColor: Colors.blueAccent,
              //     child: Text('Hello There',
              //         style: TextStyle(
              //             fontFamily: GoogleFonts.aBeeZee().fontFamily,
              //             fontSize: 40.0))),
              Shimmer.fromColors(
                  baseColor: Colors.cyan,
                  highlightColor: Colors.blueAccent,
                  child: Text("Welcome To Online-Mart",
                      style: TextStyle(
                          fontFamily: GoogleFonts.alegreya().fontFamily,
                          fontSize: 50.0)))
            ],
          )),
          SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.9)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              onChanged: (value) {
                this.email = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Email is required' : validateEmail(value)),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 12.0,
                      color: Colors.grey.withOpacity(0.9)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  ),
                  suffixIcon: IconButton(
                    splashRadius: 20,
                    icon: Icon(
                        _secureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _secureText = !_secureText;
                      });
                    },
                  )),
              obscureText: _secureText,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value.isEmpty ? 'Password is required' : null),
          SizedBox(height: 5.0),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ResetPassword()));
              },
              child: Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top: 15.0, left: 20.0),
                  child: InkWell(
                      child: Text('Forgot Password',
                          style: TextStyle(
                              color: greenColor,
                              fontFamily: 'Trueno',
                              fontSize: 11.0,
                              decoration: TextDecoration.underline))))),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              if (checkFields()) AuthService().signIn(email, password, context);
            },
            child: Container(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(25.0),
                    shadowColor: Colors.greenAccent,
                    color: greenColor,
                    elevation: 7.0,
                    child: Center(
                        child: Text('LOGIN',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Trueno'))))),
          ),
          SizedBox(height: 35.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('New to Spotify ?'),
            SizedBox(width: 5.0),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text('Register',
                    style: TextStyle(
                        color: greenColor,
                        fontFamily: 'Trueno',
                        decoration: TextDecoration.underline))),
          ]),
          SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Colors.blueAccent,
              onPrimary: Colors.black,
              minimumSize: Size(double.infinity, 50),
            ),
            icon: FaIcon(
              FontAwesomeIcons.google,
              color: Colors.red,
            ),
            label: Text("Sign Up with Google"),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLoginIn();
            },
          ),
        ]));
  }
}
