import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtea/model/database.dart';
import 'package:yourtea/model/tea.dart';
import 'package:yourtea/screen/edit_form.dart';
import 'package:yourtea/screen/palette.dart';
import 'package:yourtea/screen/homepage.dart';
import 'package:yourtea/screen/tea_list.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    void _showEditPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: EditForm(),
        );
      });
    }
    
    return StreamProvider<List<Tea>>.value(
      value: DatabaseService().tea,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Profile'),
          backgroundColor: Palette.brownColor,
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
            top: 50,
            right: 80,
            left: 80,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.fill)),
              
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.only(top: 150, left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "User Infomation",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                            color: Palette.darkColor,
                          ),
                          ),
                    ),
                  ],
                ),
              ),
        TeaList(),
        FlatButton.icon( icon: Icon(Icons.edit), label: Text('Edit'), onPressed: () => _showEditPanel())
        ]
      )
      )
    );
  }
}