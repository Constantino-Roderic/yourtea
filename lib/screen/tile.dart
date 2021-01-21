import 'package:flutter/material.dart';
import 'package:yourtea/model/tea.dart';

class TeaTile extends StatelessWidget {
  final Tea tea;
  TeaTile({this.tea});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child:Card(
        margin: EdgeInsets.fromLTRB(20, 260, 20, 0),
        elevation: 10,
        child: ListTile(
        title: Text(tea.firstname + ' ' + tea.lastname, style: TextStyle(fontSize: 22)),
        subtitle: Text('Address: ' + tea.address + '              ' + 'Contact Number: '+ tea.contact, style: TextStyle(fontSize: 18)),
      ),
    ),
    );
  }
}