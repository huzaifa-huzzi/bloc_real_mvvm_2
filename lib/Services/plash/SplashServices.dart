import 'dart:async';

import 'package:bloc_mvvm_2/Services/sessionManager/session_controller.dart';
import 'package:bloc_mvvm_2/config/Routes/Routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashServices {

  void isLogin(BuildContext context) {

    SessionManager().getUserFromPreferences().then((value){

      if(SessionManager().isLogin ?? false){
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesName.homeScreen);
        });
      }else{
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesName.loginScreen);
        });
      }

    }).onError((error,stacktrace){
      Timer(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, RoutesName.loginScreen);
      });
    });

  }



}