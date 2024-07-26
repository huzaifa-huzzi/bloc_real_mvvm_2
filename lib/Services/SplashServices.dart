import 'dart:async';

import 'package:bloc_mvvm_2/config/Routes/Routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashServices {

  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 3),() => Navigator.pushAndRemoveUntil(context, RoutesName.loginScreen as Route<Object?>, (route) => false));
  }



}