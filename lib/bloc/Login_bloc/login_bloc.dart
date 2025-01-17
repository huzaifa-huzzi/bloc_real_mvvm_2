import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm_2/Repository/Auth/login_repository.dart';
import 'package:bloc_mvvm_2/Services/sessionManager/session_controller.dart';
import 'package:bloc_mvvm_2/Utils/enum.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository ;

  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
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

    // for loading purpose
    emit(state.copywith(postApiStatus: PostApiStatus.loading));

    await loginRepository.loginApi(data).then((value)async{
        if(value.error.isNotEmpty){
         emit( state.copywith(error: value.error.toString(),postApiStatus: PostApiStatus.error));
        }else {
          await SessionManager().saveUserInPreferences(value);
          await SessionManager().getUserFromPreferences();
          emit(state.copywith(postApiStatus: PostApiStatus.success));
        }}).onError((error,stackTrace){
      emit(state.copywith(error: error.toString(),postApiStatus: PostApiStatus.error));
    });

  }

}

