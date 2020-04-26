import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:consultdocapp/Services/auth.dart';
import 'package:consultdocapp/widgets/provider_widget.dart';
import 'package:consultdocapp/Screens/Sizeconfig.dart';


class MyAccountPage extends StatefulWidget {
    MyAccountPage({Key key, this.title}) : super(key: key);

  final String title;
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

              body: Column(
      children: <Widget>[
      
        UpperSection(),
        SizedBox(height: 32.0,),
        
        
        BottomSection(),
      ],
    ) 
      

    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: color1.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Text('Security & Data'),
              SizedBox(width: 16.0,),
              Text('Settings'),
            ],),
            Text('Help')
          ],
        ),
      ),
    );
  }
}

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Divider(height: 8.0,),
          ListTile(
            title: Text("Today's activity"),
            subtitle: Text('31 tasks in 5 categories'),
            trailing: ClipOval(
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.green.withOpacity(0.2),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.green,
                  )),
            ),
          ),
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 160.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  ItemCard(Icons.favorite, 'Health', '2 tasks'),
                  ItemCard(Icons.person, 'Personal', '3 tasks'),
                  ItemCard(Icons.power, 'Power', '4 tasks'),
                  ItemCard(Icons.power, 'Power', '4 tasks'),
                  ItemCard(Icons.power, 'Power', '4 tasks'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final icon;
  final name;
  final tasks;
  const ItemCard(
   
    this.icon,
    this.name,
    this.tasks
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
          height: 160.0,
          width: 120.0,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [color1, color2])),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(icon, color: Colors.white,),
                        Spacer(),
                        Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(height: 4.0,),
                        Text(tasks, style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                      ],
                    ),
                  ),
                  ),
    );
  }
}


  
