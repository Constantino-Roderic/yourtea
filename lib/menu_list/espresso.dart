import 'package:flutter/material.dart';
import 'package:yourtea/screen/homepage.dart';
import 'package:yourtea/screen/palette.dart';

class Espresso extends StatefulWidget {
  static const routeName = '/homepage';
  @override
  _EspressoState createState() => _EspressoState();
}

class _EspressoState extends State<Espresso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Tea Home"),
        backgroundColor: Palette.brownColor,
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
                          text: "Place Order",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            color: Palette.darkColor,
                          ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 160),
            child: Container(
              height: 360,
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
                  TextFormField(
                    decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.brownColor),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.brownColor),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Your Name",
                        hintStyle: TextStyle(
                          fontSize: 14, color: Palette.lightColor),
                        )
                  ),TextFormField(
                    decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.brownColor),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.brownColor),
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Quantity",
                        hintStyle: TextStyle(
                          fontSize: 14, color: Palette.lightColor),
                        )
                  ),
                    // ignore: missing_required_param
                    RadioListTile(
                      title: const Text('Small')
                    // ignore: missing_required_param
                    ),RadioListTile(
                      title: const Text('Regular')
                    ),
                    // ignore: missing_required_param
                    RadioListTile(
                      title: const Text('Large')
                    ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
                    },
                    color: Palette.darkColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 61, vertical: 10
                    ),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Submit",
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

