import 'package:consultdocapp/Login/DocSignIN.dart';
import 'package:consultdocapp/Screens/Edit_profile.dart';

import 'package:consultdocapp/Screens/Navbar.dart';
import 'package:consultdocapp/Screens/Terms_Conditions_page.dart';
import 'package:consultdocapp/Screens/ap.dart';
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
          '/signUp': (BuildContext context) => Login(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => Login(authFormType: AuthFormType.signIn),
          '/signInDoc': (BuildContext context) => LoginDoc(authFormType: AuthFormTypeDoc.signIn),
          '/anonymousSignIn': (BuildContext context) => Login(authFormType: AuthFormType.anonymous),
          '/convertUser': (BuildContext context) => Login(authFormType: AuthFormType.convert),
          '/OTP': (BuildContext context) => LoginScreen(),
          '/Terms': (BuildContext context) =>TandC(),
          '/Ppst': (BuildContext context) =>ImageP(),
          '/John': (BuildContext context) =>HomeView()     
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


