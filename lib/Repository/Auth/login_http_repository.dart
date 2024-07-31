import 'package:bloc_mvvm_2/Data/Network/NetworkServicesApi.dart';
import 'package:bloc_mvvm_2/Repository/Auth/login_repository.dart';
import 'package:bloc_mvvm_2/config/app_url.dart';
import 'package:bloc_mvvm_2/models/user/user_model.dart';


class LoginHttpApiRepository implements LoginRepository{
  final api = NetworkServicesApi();

  Future<UserModel> loginApi(dynamic data)async{
    final response = await api.postApi(AppUrl.loginApi, data);
    return UserModel.fromJson(response);
  }


}