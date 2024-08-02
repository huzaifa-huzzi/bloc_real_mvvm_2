import 'package:bloc_mvvm_2/Repository/Auth/login_http_repository.dart';
import 'package:bloc_mvvm_2/Repository/Auth/login_repository.dart';
import 'package:bloc_mvvm_2/Repository/movies/movies_http_repository.dart';
import 'package:bloc_mvvm_2/Repository/movies/movies_repository.dart';
import 'package:bloc_mvvm_2/config/Routes/Routes_Initializing.dart';
import 'package:bloc_mvvm_2/config/Routes/Routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'bloc Mvvm',
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesHttpApiRepository());
}
