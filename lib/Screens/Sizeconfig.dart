import 'package:consultdocapp/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:consultdocapp/widgets/provider_widget.dart';

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
var profileImage = NetworkImage(
    'https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w');

class UpperSection extends StatefulWidget {
  @override
  _UpperSectionState createState() => _UpperSectionState();
}

class _UpperSectionState extends State<UpperSection> {
  
    final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  
 @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 32.0,
        ),
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
  
              SizedBox(
                height: 8.0,
              ),
              CircleAvatar(
                backgroundImage: profileImage,
                ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                '${user.displayName ?? 'Anonymous'}',
                style: TextStyle(
                  fontSize: 50.0,
                ),
              ),
              SizedBox(
                height: 4.0,
              ),
              Text(
                '${user.email ?? 'Anonymous'}',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0.0),
          child: Container(
            height: 4.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color1, color2])),
          ),
        ),
        SizedBox(height: 150.0),
    Center(
      child: FlatButton(
        
                child: Text('Log Out'), 
               color: Colors.blue,
              onPressed: () async {
                  try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print (e);
              }
              },
      )
      
    ),
    SizedBox(height: 20),
    Center(
      child: FlatButton(child: Text('Edit Profile'),
      onPressed: (){
        Navigator.of(context).pushReplacementNamed('/Ppst');

      },
      )
    ),


        SizedBox(height: 20),
    Center(
      child: FlatButton(child: Text('ui Profile'),
      onPressed: (){
        Navigator.of(context).pushReplacementNamed('/John');

      },
      )
    )
      ],
    
    );
  }
}