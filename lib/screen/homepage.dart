import 'package:flutter/material.dart';
import 'package:yourtea/menu_list/black_list.dart';
import 'package:yourtea/menu_list/capaccino.dart';
import 'package:yourtea/menu_list/espresso.dart';
import 'package:yourtea/menu_list/latte.dart';
import 'package:yourtea/menu_list/macciato.dart';
import 'package:yourtea/menu_list/mailktea.dart';
import 'package:yourtea/screen/palette.dart';
import 'maindrawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Tea Home"),
        backgroundColor: Palette.brownColor,
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                color: Palette.lightColor.withOpacity(.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "CHOOSE",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            color: Palette.darkColor,
                          ),
                          ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Your Cup of Tea",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Palette.darkColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 160),
            child: Container(
              height: 350,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
                child: Column(
                  children: [
                  RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      child: Black(),
                      barrierDismissible: false,
                    ),
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50, vertical: 10
                    ),
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Black Coffee",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      child: Espresso(),
                      barrierDismissible: false,
                    ),
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 62, vertical: 10
                    ),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Espresso",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      child: Capaccino(),
                      barrierDismissible: false,
                    ),
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 58, vertical: 10
                    ),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Capaccino",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed:  () => showDialog(
                      context: context,
                      child: Macciato(),
                      barrierDismissible: false,
                    ),
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 61, vertical: 10
                    ),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Macciato",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      child: Latte(),
                      barrierDismissible: false,
                    ),
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 75, vertical: 10
                    ),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Latte",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => showDialog(
                      context: context,
                      child: MilkTea(),
                      barrierDismissible: false,
                    ),
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 61, vertical: 10
                    ),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Milk Tea",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  )
                  ],
                ),
              ),
            ),
        ]
      ),
    );
  }
}

