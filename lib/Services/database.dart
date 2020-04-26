import 'package:cloud_firestore/cloud_firestore.dart';

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