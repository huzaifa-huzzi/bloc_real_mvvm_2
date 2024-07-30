import 'package:bloc_mvvm_2/Utils/enum.dart';
import 'package:bloc_mvvm_2/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginWidgetButton extends StatelessWidget {
  final formKey;
  const LoginWidgetButton({super.key ,required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(
      listener: (context,state){
        if(state.postApiStatus == PostApiStatus.error){
          print('issue in it');
        }
        if(state.postApiStatus == PostApiStatus.success){

        }

        if(state.postApiStatus == PostApiStatus.loading){
          print('submitting ....');
        }

    },child: BlocBuilder<LoginBloc,LoginState>(
        buildWhen: (current,previous) => false,
        builder: (context,state){
          return ElevatedButton(onPressed: (){
            if(formKey.currentState!.validate()){
              context.read<LoginBloc>().add(LoginButton());
            }
          }, child:const  Text('Login'));
        }),

    );


  }
}
