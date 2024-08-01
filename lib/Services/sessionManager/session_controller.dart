import 'dart:convert';

import 'package:bloc_mvvm_2/Services/storage/local_storage.dart';
import 'package:bloc_mvvm_2/models/user/user_model.dart';

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

  Future<void> saveUserInPreferences(dynamic user) async{
    localStorage.setValue('token',jsonEncode(user));
    localStorage.setValue('isLogin', 'true');

  }



}