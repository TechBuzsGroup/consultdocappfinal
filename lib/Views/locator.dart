import 'package:consultdocapp/Screens/VideoChat/provider/image_upload_provider.dart';
import 'package:consultdocapp/Screens/VideoChat/provider/user_provider.dart';
import 'package:consultdocapp/Services/auth.dart';
import 'package:consultdocapp/Services/firestore_service.dart';

import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

void setupLocator() {

  
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => UserProvider());
  locator.registerLazySingleton(() => ImageUploadProvider());
 //ImageUploadProvider()),
    //UserProvider()),

}
