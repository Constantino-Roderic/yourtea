
import 'package:yourtea/model/authenticate.dart';
import 'package:yourtea/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtea/model/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null){
      return Authenticate();
    }else {
      return Profile();
    }
  }
}