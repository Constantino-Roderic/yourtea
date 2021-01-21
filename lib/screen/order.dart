import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtea/model/database.dart';
import 'package:yourtea/model/tea.dart';
import 'package:yourtea/screen/palette.dart';
import 'package:yourtea/screen/homepage.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order';
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Tea>>.value(
      value: DatabaseService().tea,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Your Order'),
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
      )
    );
  }
}