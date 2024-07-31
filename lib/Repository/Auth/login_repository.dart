

import 'package:bloc_mvvm_2/Data/Network/NetworkServicesApi.dart';
import 'package:bloc_mvvm_2/config/app_url.dart';
import 'package:bloc_mvvm_2/models/user/user_model.dart';

abstract class LoginRepository {

  Future<UserModel> loginApi(dynamic data);

  }
