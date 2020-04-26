import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Test1e extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('DocCategories').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading Data');
      
      return Column(
        children: <Widget> [
          Text(snapshot.data.documents[0][''])
        ]
      );
      }
    );
  }
}