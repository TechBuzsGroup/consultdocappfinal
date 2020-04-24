
import 'package:consultdocapp/Views/AfterFV.dart';
import 'package:consultdocapp/Views/FView.dart';

import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';




class OnboardingScreen extends StatelessWidget {
  
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.green,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle greyStyle =
      TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "Product Sans");
        static const TextStyle whiteStyle =
      TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "Product Sans");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.black,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );


  final pages = [
    Container(
      
      color: Color(0xff3399cc),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
               
              ],
            ),
          ),
          Image.asset("assets/images/doctor.gif"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome To",
                  style: greyStyle, 
                ),
                Text(
                  "ConsultDoc",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "At ConsultDoc\n"
                  "You Can Get A Doctor\n"
                  "And Dicuss",
                  style: descriptionGreyStyle,
                ),
              
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      
      
      color: Color(0xFFe8def9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
              ],
            ),
          ),
          
          Image.asset("assets/images/doctora.gif"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Doctors Ready",
                  style: whiteStyle,
                ),
                Text(
                  "To Consult",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "\n"
                  "\n"
                  "",
                  style: descriptionWhiteStyle,
                ),
              ],
            ),
          )
        ],
      ),
    ),
     Container(
      color: Color(0xFF25b7e1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
              ],
            ),
          ),
          Image.asset("assets/images/on2.gif"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Get Doctors ",
                  style: whiteStyle,
                ),
                Text(
                  "And Help Yourself",
                  style: boldStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "",
                  style: descriptionWhiteStyle,
                ),
              ],
            ),
          )
        ],
        
      ),
     
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      
    debugShowCheckedModeBanner: false,
    
      home: Scaffold(
        
        
        floatingActionButton: FlatButton(
          child: Text('Skip', style: TextStyle(
            fontSize: 24,
          ),) , 
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => FirstView()),
  );
          },
        ),
       
        body: LiquidSwipe(
          pages: pages,
          enableLoop: true,
          fullTransitionValue: 300,
          enableSlideIcon: true,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    );
  }
}
