  // GetIt => class dependency injection (files depend on each other).
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

Future<void> setupGetIt() async {

  getIt.registerLazySingleton(() => FirebaseFirestore.instance);



}
