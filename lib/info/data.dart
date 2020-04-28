import 'package:consultdocapp/model/speciality.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



List<SpecialityModel> getSpeciality(){

  List<SpecialityModel> specialities = new List<SpecialityModel>();
  SpecialityModel specialityModel = new SpecialityModel();

  //1

    
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "Paedratic";
  specialityModel.imgAssetPath = "assets/images/home1.png";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);
  specialityModel = new SpecialityModel();

  //2
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "PedraticSpecialist";
  specialityModel.imgAssetPath = "assets/img2.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();

  //3
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Child Care";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel();
   specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Child Care";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);


  specialityModel = new SpecialityModel();
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Child Care";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);
   specialityModel = new SpecialityModel();
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Child Care";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);


   specialityModel = new SpecialityModel();
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Child Care";
  specialityModel.imgAssetPath = "assets/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  return specialities;
}


class DatabaseService {
 final String uid;
    DatabaseService({ this.uid});

final CollectionReference docCategory = Firestore.instance.collection('DocCategories');

Future updateUserData(int noOfDoctor, String specialilty,  ) async {
  return await docCategory.document(uid).setData({
'specialilty' : specialilty,
 'noOfDoctors' : noOfDoctor,

  });
}

}


class Datanase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder( 
      stream: Firestore.instance.collection('Specialility').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Text('');
      }
      
    );
  }
}