import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:consultdocapp/widgets/custom_dialog.dart';

class FirstView extends StatelessWidget {
  final primaryColor = const Color(0xFFd75b5b);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: _width,
        height: _height,
        color: primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: _height * 0.10),
                AutoSizeText(
                  "Get Started By Signing Up",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: _height * 0.25),
                RaisedButton(
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                    child: Text(
                      "Sign In As Doctor ",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/signInDoc');
                    
                  },
                ),
                SizedBox(height: _height * 0.05),
                RaisedButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                    child: Text(
                      "Sign Up As Client ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                   Navigator.of(context).pushReplacementNamed('/signIn');
                  },
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
