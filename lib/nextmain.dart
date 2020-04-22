import 'package:consultdocapp/Screens/Navbar.dart';
import 'package:consultdocapp/onboarding.dart';
import 'package:flutter/material.dart';


import 'package:consultdocapp/SignUp.dart';

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
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn),
          '/anonymousSignIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.anonymous),
          '/convertUser': (BuildContext context) => SignUpView(authFormType: AuthFormType.convert),
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


