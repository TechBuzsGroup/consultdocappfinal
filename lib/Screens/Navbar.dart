import 'package:consultdocapp/Screens/myorderspage.dart';
import 'package:consultdocapp/Screens/page2.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:consultdocapp/Screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:consultdocapp/Screens/myaccountpage.dart';


 


class BottomBarNavigationPatternExample extends StatefulWidget {
  @override



  final FirebaseUser user;

  BottomBarNavigationPatternExample({this.user});
  
  _BottomBarNavigationPatternExampleState createState() => _BottomBarNavigationPatternExampleState();
}



  
class _BottomBarNavigationPatternExampleState extends State<BottomBarNavigationPatternExample> 
{
  

  
  int currentPage = 0;
  final _pageOptions = [HomePage(),Page1(), Page2(), MyAccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pageOptions[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.green,
        tabs: [
          TabData(iconData: Icons.home, title: ""),
          TabData(iconData: Icons.book, title: ""),
          TabData(iconData: Icons.stars, title: ""),
          TabData(iconData: Icons.account_circle, title: "")
        ],
        onTabChangedListener: (int position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}