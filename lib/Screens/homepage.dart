import 'package:consultdocapp/Screens/notfication_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _listItem = [
    'assets/images/consult.jpg',
    'assets/images/doctor.gif',
    'assets/images/consult.jpg',
    'assets/images/doctor.gif',
    'assets/images/consult.jpg',
    'assets/images/doctora.gif',
    'assets/images/consult.jpg',
    'assets/images/doctor.gif',
    'assets/images/fever.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF736EC3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Dashboard"),
        actions: <Widget>[

        IconButton(icon: Icon(Icons.notifications), onPressed: (){
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NotificationPage()),
  );
        }) 
          
         ,
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage('assets/images/consult.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.2),
                      ]
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Welcome To ConsultDoc", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Center(child: Text("Start Now", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(height: 30,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem.map((item) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Transform.translate(
                        offset: Offset(50, -50),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 65, vertical: 63),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Icon(Icons.bookmark_border, size: 15,),
                        ),
                      ),
                    ),
                  )).toList(),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}