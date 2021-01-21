import 'package:flutter/material.dart';
import 'dart:async';
import 'package:yourtea/screen/login_signup.dart';


class SplashScreen extends StatefulWidget {
  static const routeName = '/splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
            _navigateToHome();
        }
    );
  }


  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LoginSignup()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFc1aa78),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.all(40),
            child: Column(
              children: <Widget>[
                Image.asset("assets/images/logo.png"),
                Text("Your Cup of Tea", style: TextStyle(fontSize: 26, color: Color(0xFF663203)),
                ),
              ],
              ),
          ),
          ],
        ),
      ),
    );
  }
}