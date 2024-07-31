 //This has been created for dummy data ...if we dont have the api and client use the dummy data so we are gonna do like this
import 'package:bloc_mvvm_2/Repository/Auth/login_repository.dart';
import 'package:bloc_mvvm_2/models/user/user_model.dart';

class LoginMockApiRepository implements LoginRepository {

  @override
  Future<UserModel> loginApi(dynamic data)async{
    await Future.delayed(const Duration(seconds: 2));
    final response = {'toke' : 'huzaifakhan'};
    return UserModel.fromJson(response);
  }



}