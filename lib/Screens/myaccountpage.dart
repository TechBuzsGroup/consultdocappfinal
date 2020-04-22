import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:consultdocapp/Services/auth.dart';
import 'package:consultdocapp/widgets/provider_widget.dart';


class MyAccountPage extends StatefulWidget {
  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add_to_queue),
            onPressed: () async {
              try {
                AuthService auth = Provider.of(context).auth;
                await auth.signOut();
                print("Signed Out!");
              } catch (e) {
                print (e);
              }
            },
          ),
          ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Name: ${user.displayName ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
        ),
      ],
          ),
          ),
          
      ),
      
      
    );

       }
}





  
  

