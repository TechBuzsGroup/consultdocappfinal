
import 'package:consultdocapp/Screens/Service_breakdown.dart';
import'package:consultdocapp/Payment/payments.dart';
import 'package:consultdocapp/Screens/VideoChat/main.dart';
import 'package:consultdocapp/Screens/VideoChat/screens/home_screen.dart';
import'package:consultdocapp/Screens/h.dart';

import 'package:consultdocapp/info/data.dart';
import 'package:consultdocapp/model/speciality.dart';
import 'package:consultdocapp/Home/doctor_info.dart';
import 'package:consultdocapp/widgets/src/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:consultdocapp/Animations/FadeAnimation.dart';
import 'package:flutter/rendering.dart';


String selectedCategorie= "Children";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> categories = ["Children",""];

  List<SpecialityModel> specialities;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    specialities = getSpeciality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    
      body: SingleChildScrollView(
        child: Container(
          
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              FadeAnimation(2,
              Text("Find Your \nConsultation", style: TextStyle(
                color: Colors.black87.withOpacity(0.8),
                fontSize: 30,
                fontWeight: FontWeight.w600
              ),),),

              SizedBox(height: 30,),
              FadeAnimation(2, 
              Text("Categories", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),),
              SizedBox(height: 20,),
              FadeAnimation(.5, 
              Container(
                height: 30,
                child: ListView.builder(
                itemCount: categories.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                  return CategorieTile(
                    categorie: categories[index],
                    isSelected: selectedCategorie == categories[index],
                    context: this,
                  );
                    }),
              ),),
                      SizedBox(height: 20,),
                           Container(
              height: 280,
              width: double.infinity,
              child: ListView(
                padding: EdgeInsets.only(bottom: 20, left: 20),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(1.3, GestureDetector(
                    child: Container(child: makeCard(
                    context: context,
                    startColor: Color.fromRGBO(251, 121, 155, 1),
                    endColor: Color.fromRGBO(251, 53, 105, 1),
                    image: 'assets/socks-one.png',
                    icon: 'Child Care'
                  ), ),
                      
                  onTap: () {
                    Navigator.push(context, (MaterialPageRoute(builder: (context) => DocPay())));
                  },
                  )
               ),
                  FadeAnimation(1.4, makeCard(
                    context: context,
                    startColor: Color.fromRGBO(203, 251, 255, 1),
                    endColor: Color.fromRGBO(81, 223, 234, 1),
                    image: 'assets/socks-two.png',
                    icon: 'access_time'
                    
                  )),
                    FadeAnimation(1.4, makeCard(
                    context: context,
                    startColor: Color.fromRGBO(203, 251, 255, 1),
                    endColor: Color.fromRGBO(81, 223, 234, 1),
                    image: 'assets/socks-two.png'
                  )),
                    FadeAnimation(1.4, makeCard(
                    context: context,
                    startColor: Color.fromRGBO(203, 251, 255, 1),
                    endColor: Color.fromRGBO(81, 223, 234, 1),
                    image: 'assets/socks-two.png'
                  ))
                ],
              ),
            ),
              SizedBox(height: 20,),
              FadeAnimation(.5, 
              Text("Doctors", style: TextStyle(
                  color: Colors.black87.withOpacity(0.8),
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),),),
              SizedBox(height: 20,),
              FlatButton(child: Text('data'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => IndexPage()));
              },),

               
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatefulWidget {

  final String categorie;
  final bool isSelected;
  _HomePageState context;
  CategorieTile({this.categorie, this.isSelected,this.context});

  @override
  _CategorieTileState createState() => _CategorieTileState();
}

class _CategorieTileState extends State<CategorieTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.context.setState(() {
          selectedCategorie = widget.categorie;
        });
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(left: 8),
        height: 30,
        decoration: BoxDecoration(
          color: widget.isSelected ? Color(0xffFFD0AA) : Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: Text(widget.categorie, style: TextStyle(
          color: widget.isSelected ?  Color(0xffFC9535) : Color(0xffA1A1A1)
        ),),
      ),
    );
  }
}


class SpecialistTile extends StatelessWidget {

  final String imgAssetPath;
  final String speciality;
  final int noOfDoctors;
  final Color backColor;
  SpecialistTile({@required this.imgAssetPath,@required this.speciality
    ,@required this.noOfDoctors, @required this.backColor});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(24)
      ),
      padding: EdgeInsets.only(top: 16,right: 16,left: 16),
      child: FlatButton(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Text(speciality, style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),
         
          
          SizedBox(height: 6,),
          FadeAnimation(1, 
            Text("$noOfDoctors Doctors", style: TextStyle(
            color: Colors.white,
            fontSize: 13
          ),
          ),
       ),
         
        
          
        ],
      
      ),
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Servicelist()));
      },)
      ,
    
    );
  }
}


  Widget makeCard({context, startColor, endColor, image, icon}) {
    return Container(
  
      
       child: AspectRatio(
        aspectRatio: 3/4,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [
                startColor,
                endColor
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[350],
                blurRadius: 10,
                offset: Offset(5, 10)
              )
            ]
          ),
          child:   Center(child: Text(image),),
        
        
        
        ),
      
      ),
   
      );
 
  }