

import 'package:bloc_mvvm_2/Data/Network/NetworkServicesApi.dart';
import 'package:bloc_mvvm_2/config/app_url.dart';
import 'package:bloc_mvvm_2/models/user/user_model.dart';

class LoginRepository {

  final api = NetworkServicesApi();
  Future<UserModel> loginApi(dynamic data)async{
      final response = await api.postApi(AppUrl.loginApi, data);
      return UserModel.fromJson(response);
  }


}