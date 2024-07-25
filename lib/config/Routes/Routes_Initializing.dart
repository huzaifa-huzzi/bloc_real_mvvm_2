import 'package:bloc_mvvm_2/config/Routes/Routes_name.dart';
import 'package:bloc_mvvm_2/config/views/home/home_screen.daart.dart';
import 'package:bloc_mvvm_2/config/views/login/LoginScreen.dart';
import 'package:bloc_mvvm_2/config/views/splash/splashScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){

      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) =>const  Splashscreen());

      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) =>const  HomeScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) =>const  LoginScreen());

      default :
        return MaterialPageRoute(builder: (context){
          return const Scaffold(
            body: Center(
              child: Text('No Page Generate'),
            ),
          );
        });
    }
    
    
  }
  
}