import 'package:flutter/material.dart';
import 'package:consultdocapp/Services/auth.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:consultdocapp/widgets/provider_widget.dart';
import 'package:consultdocapp/Animations/FadeAnimation.dart';



enum AuthMode { SignupDoc, LoginDoc }

final primaryColor = Colors.blue;

enum AuthFormTypeDoc { signIn, signUp, reset, anonymous, convert }
class LoginDoc extends StatefulWidget {

  final AuthFormTypeDoc authFormType;

  LoginDoc({Key key, @required this.authFormType}) : super(key: key);
    @override
  _LoginDocState createState() =>
   _LoginDocState(authFormType: this.authFormType);
}

class _LoginDocState extends State<LoginDoc> {
 AuthFormTypeDoc authFormType;

  _LoginDocState({this.authFormType});
    final formKey = GlobalKey<FormState>();
  String _email, _password, _name, _warning;

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == "signUp") {
      setState(() {
        authFormType = AuthFormTypeDoc.signUp;
      });
    } else if (state == 'home') {
      Navigator.of(context).pop();
    } else {
      setState(() {
        authFormType = AuthFormTypeDoc.signIn;
      });
    }
  }


  bool validate() {
    final form = formKey.currentState;
    if (authFormType == AuthFormTypeDoc.anonymous) {
      return true;
    }
    form.save();
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        switch (authFormType) {
          case AuthFormTypeDoc.signIn:
            await auth.signInWithEmailAndPassword(_email, _password);
            Navigator.of(context).pushReplacementNamed('/DocV');
            break;
          case AuthFormTypeDoc.signUp:
           
            Navigator.of(context).pushReplacementNamed('/DocV');
            break;
          case AuthFormTypeDoc.reset:
            await auth.sendPasswordResetEmail(_email);
            _warning = "A password reset link has been sent to $_email";
            setState(() {
              authFormType = AuthFormTypeDoc.signIn;
            });
            break;
          case AuthFormTypeDoc.anonymous:
            await auth.singInAnonymously();
            Navigator.of(context).pushReplacementNamed('/DocV');
            break;
          case AuthFormTypeDoc.convert:
            await auth.convertUserWithEmail(_email, _password, _name);
            Navigator.of(context).pop();
            break;
        }
      } catch (e) {
        print(e);
        setState(() {
          _warning = e.message;
        });
      }
    }
  }




  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
       color: Color(0xFF6495ed)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,  //m8Oq9ycK9VntE8mk8om5yoQbB10=   first one
                children: <Widget>[
                  Center(child: FadeAnimation(1, buildHeaderText() ,), ),
                  
                  SizedBox(height: 10,),
                  
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                         color: Color(0xFFedbc64),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 0,),
                        FadeAnimation(1.4, Container(
                          
                          child: Column(
                            children: <Widget>[
                
                showAlert(),
            
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: buildInputs() + buildButtons(),
                    ),
                  ),
                ),
                            ],
                          ),
                        )),
                                         SizedBox(height: 0,),
            FadeAnimation(2,
            Container(
                  
                    child: Column(
                      
                    ),
                  
            )
            ),
                       
                     
                       
                        Row(
                          children: <Widget>[
                      
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget showAlert() {
    if (_warning != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _warning,
                maxLines: 3,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    _warning = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }

AutoSizeText buildHeaderText() {
    String _headerText;
    if (authFormType == AuthFormTypeDoc.signIn) {
      _headerText = "Doctor\nSign In";
     
    } else if (authFormType == AuthFormTypeDoc.reset) {
      _headerText = "Reset Password";
    } else {
      _headerText = "Create New Account";
    }
    return AutoSizeText(
      _headerText,
      maxLines: 2,
      
      style: TextStyle(
        fontSize: 35,
        color: Colors.white,
      ),
    );
  }


    List<Widget> buildInputs() {
    List<Widget> textFields = [];
    if (authFormType == AuthFormTypeDoc.reset) {
      textFields.add(
        TextFormField(
          validator: EmailValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Email"),
          onSaved: (value) => _email = value,
        ),
      );
      textFields.add(SizedBox(height: 20));
      return textFields;
    }

    // if were in the sign up state add name
    if ([AuthFormTypeDoc.signUp, AuthFormTypeDoc.convert].contains(authFormType)) {
      textFields.add(
        TextFormField(
          validator: NameValidator.validate,
          style: TextStyle(fontSize: 22.0),
          decoration: buildSignUpInputDecoration("Name"),
          onSaved: (value) => _name = value,
        ),
      );
      textFields.add(SizedBox(height: 20));
    }

    // add email & password
    textFields.add(
      TextFormField(
        validator: EmailValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Email"),
        onSaved: (value) => _email = value,
      ),
    );
    textFields.add(SizedBox(height: 20));
    textFields.add(
      TextFormField(
        validator: PasswordValidator.validate,
        style: TextStyle(fontSize: 22.0),
        decoration: buildSignUpInputDecoration("Password"),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),
    );
    textFields.add(SizedBox(height: 20));

    return textFields;
  }

  InputDecoration buildSignUpInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0)),
      contentPadding:
          const EdgeInsets.only(left: 14.0, bottom: 10.0, top: 10.0),
    );
  }

  List<Widget> buildButtons() {
    String _submitButtonText;

    if (authFormType == AuthFormTypeDoc.signIn) {
      _submitButtonText = "Sign In";
    } else if (authFormType == AuthFormTypeDoc.reset) {
      _submitButtonText = "Submit";
    } else if (authFormType == AuthFormTypeDoc.convert) {
      _submitButtonText = "Sign Up";
    } else {
      _submitButtonText = "Sign Up";
    }

    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.white,
          textColor: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _submitButtonText,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
            ),
          ),
          onPressed: submit,
        ),
      ),
     
      
    ];
  }

    List<Widget> buildOre() {
    String _switchButtonText;
    bool _showForgotPassword = false;

    if (authFormType == AuthFormTypeDoc.signIn) {
      _switchButtonText = "Create New Account";
     
      _showForgotPassword = true;
    } else if (authFormType == AuthFormTypeDoc.reset) {
      _switchButtonText = "Return to Sign In";
  
    } else if (authFormType == AuthFormTypeDoc.convert) {
      _switchButtonText = "Cancel";

    } else {
      _switchButtonText = "Have an Account? Sign In";

    }

    return [
      Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: Colors.white,
          textColor: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              ''
             
            ),
          ),
          onPressed: submit,
        ),
      ),
      showForgotPassword(_showForgotPassword),
      FlatButton(
        child: Text(
          _switchButtonText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          
        },
      ),
      
    ];
  }

  Widget showForgotPassword(bool visible) {
    return Visibility(
      child: FlatButton(
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            authFormType = AuthFormTypeDoc.reset;
          });
        },
      ),
      visible: visible,
    );
  }


  


}