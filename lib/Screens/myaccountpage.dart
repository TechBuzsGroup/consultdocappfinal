import 'package:consultdocapp/FInal_vidchat/provider/user_provider.dart';
import 'package:consultdocapp/FInal_vidchat/screens/chatscreens/widgets/cached_image.dart';
import 'package:consultdocapp/FInal_vidchat/utils/universal_variables.dart';
import 'package:consultdocapp/FInal_vidchat/widgets/mainappbar.dart';
import 'package:consultdocapp/Services/auth.dart';
import 'package:consultdocapp/Views/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  final AuthService _authenticationMethods = AuthService();
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    final double itemHeight = media.height;
    final double itemWidth = media.width;

    final UserProvider userProvider = Provider.of<UserProvider>(context);
    String _alertdialogTitle,
        _alertdialogDescription,
        _alertdialogCancelButton,
        _alertdialogOkButton;
    _alertdialogTitle = 'Logout';
    _alertdialogDescription = 'Are you sure you want to Logout?';
    _alertdialogCancelButton = 'Cancel';
    _alertdialogOkButton = 'Ok';

    return Scaffold(
      appBar: PreferredSize(
        child:
            MainAppBar(title: userProvider.getUser.name, back: "userprofile"),
        preferredSize: Size.fromHeight(media.height),
      ),
      body: Container(
        height: media.height,
        child: Stack(
          children: <Widget>[
            // Dashboard
            Positioned(
              width: media.width,
              child: Container(
                height: media.height * 0.2,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: UniversalVariables.separatorColor,
                      blurRadius: 4.8,
                      spreadRadius: 3.0,
                      offset: Offset(0.0, 2.0),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(64.0),
                      bottomRight: Radius.circular(64.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: new Padding(
                        padding: EdgeInsets.only(
                            left: media.width * 0.024,
                            top: media.height * 0.04,
                            right: media.width * 0.0,
                            bottom: media.height * 0.01),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                userProvider.getUser.name,
                                style: TextStyle(
                                  color: UniversalVariables.textColor,
                                  fontSize: media.width * 0.064,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                userProvider.getUser.username,
                                style: TextStyle(
                                  color: UniversalVariables.textColor,
                                  fontSize: media.width * 0.036,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: media.height * 0.12,
              width: media.width,
              child: Container(
                height: media.height * 0.2,
                width: media.height * 0.2,
                child: CachedImage(
                  userProvider.getUser.profilePhoto,
                  width: 80,
                  height: 80,
                  radius: 80,
                  isRound: true,
                ),
              ),
            ),
            Positioned(
              top: media.height * 0.34,
              width: media.width,
              height: media.height,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: media.width * 0.04,
                        top: media.height * 0.0,
                        right: media.width * 0.04,
                        bottom: media.height * 0.0),
                    child: Card(
                      elevation: 1.0,
                      margin: EdgeInsets.only(
                          left: media.width * 0.02,
                          top: media.height * 0.005,
                          right: media.width * 0.02,
                          bottom: media.height * 0.005),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: [
                            BoxShadow(
                              color: greyShadow,
                              blurRadius: 2.0,
                              spreadRadius: 0.48,
                              offset: Offset(0.0, 4.2),
                            )
                          ],
                        ),
                        child: new InkWell(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: 8,
                                  top: 8,
                                  right: 8,
                                  bottom: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 10,
                                      child: new Padding(
                                        padding: EdgeInsets.only(
                                            left: media.width * 0.04,
                                            top: media.height * 0.0,
                                            right: media.width * 0.0,
                                            bottom: media.height * 0.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                userProvider.getUser.email,
                                                style: TextStyle(
                                                  color: UniversalVariables
                                                      .textColor,
                                                  fontSize: media.width * 0.045,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: media.height * 0.42,
              width: media.width,
              height: media.height,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: media.width * 0.04,
                        top: media.height * 0.0,
                        right: media.width * 0.04,
                        bottom: media.height * 0.0),
                    child: Card(
                      elevation: 1.0,
                      margin: EdgeInsets.only(
                          left: media.width * 0.02,
                          top: media.height * 0.005,
                          right: media.width * 0.02,
                          bottom: media.height * 0.005),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(4.0),
                          boxShadow: [
                            BoxShadow(
                              color: greyShadow,
                              blurRadius: 2.0,
                              spreadRadius: 0.48,
                              offset: Offset(0.0, 4.2),
                            )
                          ],
                        ),
                        child: new InkWell(
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor:
                                      UniversalVariables.separatorColor,
                                  title: Text(
                                    _alertdialogTitle,
                                    style: TextStyle(
                                      color: UniversalVariables.blueColor,
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          _alertdialogDescription,
                                          style: TextStyle(
                                            color: UniversalVariables.blueColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        _alertdialogCancelButton,
                                        style: TextStyle(
                                          color: UniversalVariables.blueColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(
                                        _alertdialogOkButton,
                                        style: TextStyle(
                                          color: UniversalVariables.blueColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        _authenticationMethods.signOut();
                                        Navigator.pop(context);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        OnboardingScreen()));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            verticalDirection: VerticalDirection.down,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  left: 8,
                                  top: 8,
                                  right: 8,
                                  bottom: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 10,
                                      child: new Padding(
                                        padding: EdgeInsets.only(
                                            left: media.width * 0.04,
                                            top: media.height * 0.0,
                                            right: media.width * 0.0,
                                            bottom: media.height * 0.0),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'Logout',
                                                style: TextStyle(
                                                  color: UniversalVariables
                                                      .textColor,
                                                  fontSize: media.width * 0.045,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
