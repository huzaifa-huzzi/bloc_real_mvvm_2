import 'package:bloc/bloc.dart';
import 'package:bloc_mvvm_2/Utils/enum.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
      on<EmailChanged>(_onEmailChanged);
      on<PasswordChanged>(_onPasswordChanged);
  }

  //functions for emit states

   void _onEmailChanged(EmailChanged event,Emitter<LoginState>emit){
    emit(state.copywith(email: event.email));
   }
   void _onPasswordChanged(PasswordChanged event,Emitter<LoginState>emit){
    emit(state.copywith(password: event.password));
  }

}

