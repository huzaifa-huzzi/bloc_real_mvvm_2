import 'dart:convert';

import 'package:bloc_mvvm_2/Services/storage/local_storage.dart';
import 'package:bloc_mvvm_2/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';

class SessionManager {
  static final SessionManager _session = SessionManager._internal();

  final LocalStorage localStorage = LocalStorage();
  UserModel user = UserModel();
  bool? isLogin;

  factory SessionManager(){
    return _session;
  }

  SessionManager._internal(){
  }


  // for saving user

  Future<void> saveUserInPreferences(dynamic user) async{
    localStorage.setValue('token',jsonEncode(user));
    localStorage.setValue('isLogin', 'true');

  }

  //now getting them

 Future<void> getUserFromPreferences()async{

    try{
      var userData = await localStorage.readValue('token');
      var isLogin = await localStorage.readValue('isLogin');
      if(userData.isNotEmpty){
        SessionManager().user = UserModel.fromJson(jsonDecode(userData));
      }
      SessionManager().isLogin = isLogin == 'true' ? true : false ;
    }catch(e){
      debugPrint(e.toString());
    }

 }

}