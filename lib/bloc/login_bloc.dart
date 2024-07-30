import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm_2/Repository/Auth/login_repository.dart';
import 'package:bloc_mvvm_2/Utils/enum.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
      on<EmailChanged>(_onEmailChanged);
      on<PasswordChanged>(_onPasswordChanged);
      on<LoginButton>(_loginButton);
  }

  //functions for emit states

   void _onEmailChanged(EmailChanged event,Emitter<LoginState>emit){
    emit(state.copywith(email: event.email));
   }
   void _onPasswordChanged(PasswordChanged event,Emitter<LoginState>emit){
    emit(state.copywith(password: event.password));
  }
   void  _loginButton(LoginButton event,Emitter<LoginState>emit)async{
    Map data= {
      "email": state.email,
      "password": state.password
    };

    await loginRepository.loginApi(data).then((value){
        if(value.error.isNotEmpty){
          print('successful');
        }else{
          state.copywith(error: value.error.toString());
        }
    }).onError((error,stackTrace){
      emit(state.copywith(error: error.toString()));
    });

  }

}

