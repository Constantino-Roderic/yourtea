
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtea/model/database.dart';
import 'package:yourtea/model/user.dart';
import 'package:yourtea/screen/homepage.dart';
import 'package:yourtea/screen/palette.dart';

class EditForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formkey = GlobalKey<FormState>();

  String _currentfirstname;
  String _currentlastname;
  String _currentaddress;
  String _currentcontact;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      // ignore: missing_return
      builder: (context, snapshot) {
        if(snapshot.hasData){

          // ignore: unused_local_variable
          UserData userdata = snapshot.data;
          var userData;
          return Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Text('Edit Your Information.', style: TextStyle(fontSize: 18.0)),
              SizedBox(height: 10.0),
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
                hintText: 'First Name',
                ),
                initialValue: userData.firstname,
                validator: (val) => val.isEmpty ? 'Enter Valid Text' : null,
                onChanged: (val) => setState(() => _currentfirstname = val),
              ),
              SizedBox(height: 10),
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
                hintText: 'Last Name',
                ),
                initialValue: userData.lastname,
                validator: (val) => val.isEmpty ? 'Enter Valid Text' : null,
                onChanged: (val) => setState(() => _currentlastname = val),
              ),
              SizedBox(height: 10),
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
                hintText: 'Address',
                ),
                initialValue: userData.address,
                validator: (val) => val.isEmpty ? 'Enter Valid Text' : null,
                onChanged: (val) => setState(() => _currentaddress = val),
              ),
              SizedBox(height: 10),
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
                hintText: 'Contact Number',
                ),
                initialValue: userData.contact,
                validator: (val) => val.isEmpty ? 'Enter Valid Text' : null,
                onChanged: (val) => setState(() => _currentcontact = val),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
                RaisedButton(
                child: Text(
                    'UPDATE'
                ), 
                onPressed: () async{ 
                  print(_currentfirstname);
                  print(_currentlastname);
                  print(_currentaddress);
                  print(_currentcontact);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Palette.brownColor,
                textColor: Colors.white,
              )
            ]
          ),
        );
        }else{
          return HomePage();
        }
        
      }
    );
  }
}