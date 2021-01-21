import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourtea/model/tea.dart';
import 'package:yourtea/screen/tile.dart';

class TeaList extends StatefulWidget {
  @override
  _TeaListState createState() => _TeaListState();
}

class _TeaListState extends State<TeaList> {
  @override
  Widget build(BuildContext context) {
    final tea  = Provider.of<List<Tea>>(context);

    return ListView.builder(
      itemCount: tea.length,
      itemBuilder: (context, index){
        return TeaTile(tea: tea[index]);
      },
    );
  }
}
