
import 'package:flutter/material.dart';
import 'package:yourtea/screen/palette.dart';
import 'package:yourtea/screen/homepage.dart';

class EditAccount extends StatefulWidget {
  static const routeName = '/edit_account';
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Your Tea Home"),
        backgroundColor: Palette.brownColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(HomePage.routeName);
          },
        ),
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
                          text: "Enter",
                          style: TextStyle(
                            fontSize: 30,
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
                      "Your Bssic Profile",
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
                              hintText: "First Name",
                              hintStyle: TextStyle(
                                fontSize: 14, color: Palette.lightColor),
                              )
                        ),
                        
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      
                    ),
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
                              hintText: "Last Name",
                              hintStyle: TextStyle(
                                fontSize: 14, color: Palette.lightColor),
                              )
                        ),
                        
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      
                    ),
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
                              hintText: "Home Address",
                              hintStyle: TextStyle(
                                fontSize: 14, color: Palette.lightColor),
                              )
                        ),
                        
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      
                    ),
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
                            hintText: "Contact Number",
                            hintStyle: TextStyle(
                              fontSize: 14, color: Palette.lightColor),
                            )
                      ),
                      Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                    ),
                    RaisedButton(
                        child: Text(
                            'Submit'
                        ),
                        onPressed: (){

                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Palette.brownColor,
                        textColor: Colors.white,
                      ),
                  ],
                ),
              ),
            ),
        ]
      ),
    );
  }
}

