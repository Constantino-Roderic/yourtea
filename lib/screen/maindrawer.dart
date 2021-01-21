import 'package:flutter/material.dart';
import 'package:yourtea/screen/login_signup.dart';
import 'package:yourtea/screen/homepage.dart';
import 'package:yourtea/screen/profile.dart';
import 'package:yourtea/screen/order.dart';

class MainDrawer extends StatelessWidget {
  static const routeName = '/maindrawer';
  const MainDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 180,
        margin: EdgeInsets.only(bottom: 30, top: 30),
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              SizedBox(
                height: 1.0,
              ),
              Text(
                "Your Cup of Tea",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      ListTile(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(HomePage.routeName);
        },
        leading: Icon(
          Icons.home,
          color: Colors.black,
        ),
        title: Text("Home"),
      ),
      ListTile(
        onTap: () {Navigator.of(context).pushReplacementNamed(OrderPage.routeName);
        },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("My Order"),
      ),

      ListTile(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(Profile.routeName);
        },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        title: Text("My Account"),
      ),

      ListTile(
        onTap: () {
          Navigator.of(context).pushReplacementNamed(LoginSignup.routeName);
        },
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text("Logout"),
      ),
    ]);
  }
}