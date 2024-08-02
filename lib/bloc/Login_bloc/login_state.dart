part of 'login_bloc.dart';


class LoginState extends Equatable {
  final String email;
  final String password;
  final String error;
  final PostApiStatus postApiStatus;

  const LoginState({this.email = '',this.password ='',this.postApiStatus = PostApiStatus.initial,this.error= ''});

  //copywith ftn

   LoginState copywith({String? email,String? password,PostApiStatus? postApiStatus,String? error }){
     return LoginState(
       email:  email ?? this.email,
       password: password ?? this.password,
         postApiStatus: postApiStatus ?? this.postApiStatus,
       error: error ?? this.error
     );
}


  @override
  List<Object> get props => [email,password,error,postApiStatus];


}

