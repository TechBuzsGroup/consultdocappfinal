import 'package:consultdocapp/Services/auth.dart';
import 'package:consultdocapp/Services/firestore_service.dart';

import 'package:get_it/get_it.dart';


GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() => FirestoreService());

}
