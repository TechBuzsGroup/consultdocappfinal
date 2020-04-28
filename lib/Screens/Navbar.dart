import 'package:consultdocapp/Screens/h.dart';
import 'package:consultdocapp/Screens/myaccountpage.dart';
import 'package:consultdocapp/Screens/page2.dart';
import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:consultdocapp/Screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';



 


class BottomBarNavigationPatternExample extends StatefulWidget {
  @override



  final FirebaseUser user;

  BottomBarNavigationPatternExample({this.user});
  
  _BottomBarNavigationPatternExampleState createState() => _BottomBarNavigationPatternExampleState();
}



  
class _BottomBarNavigationPatternExampleState extends State<BottomBarNavigationPatternExample> 
{
  

  
  int currentPage = 0;
  final _pageOptions = [HomePage(),DoctorPage(),  MyAccountPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _pageOptions[currentPage],
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Color(0xFF36CEEE),
        inactiveIconColor: Color(0xFF36CEEE),
        
        tabs: [
          TabData(iconData: (Icons.home), title: ""),
          TabData(iconData: Icons.devices_other, title: ""),
          
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