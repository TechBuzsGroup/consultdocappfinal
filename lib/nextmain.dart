import 'package:consultdocapp/Screens/Navbar.dart';
import 'package:consultdocapp/Views/onboarding.dart';
import 'package:consultdocapp/Services/phone_auth.dart';
import 'package:flutter/material.dart';


import 'package:consultdocapp/Login/SignUp.dart';

import 'package:consultdocapp/widgets/provider_widget.dart';
import 'package:consultdocapp/Services/auth.dart';



class NextMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(   
      auth: AuthService(),
      child: MaterialApp(
        title: "Green Horizon",
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(),
          '/signUp': (BuildContext context) => Login(),
          '/signIn': (BuildContext context) => Login(),
          '/anonymousSignIn': (BuildContext context) => Login(),
          
          '/OTP': (BuildContext context) => Login()
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? BottomBarNavigationPatternExample() : OnboardingScreen();
        }
        return CircularProgressIndicator();
      },
    );
  }

  void navigateTo(Type examplePage) {}
}


