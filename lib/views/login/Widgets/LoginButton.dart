import 'package:bloc_mvvm_2/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginWidgetButton extends StatelessWidget {
  final formKey;
  const LoginWidgetButton({super.key ,required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      buildWhen: (current,previous) => false,
        builder: (context,state){
      return ElevatedButton(onPressed: (){
        if(formKey.currentState!.validate()){
          if(state.password.length < 6){
            print('Please enter password greater than 6');
          }
           context.read<LoginBloc>().add(LoginButton());
        }
      }, child:const  Text('Login'));
    });


  }
}
