import 'package:bloc_mvvm_2/bloc/Login_bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key,required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc,LoginState>(
      buildWhen: (current,previous) => current.password != previous.password,
        builder: (context,states){
          return TextFormField(
            keyboardType: TextInputType.text,
            focusNode: passwordFocusNode,
            decoration:const  InputDecoration(hintText: 'Password',border: OutlineInputBorder()),
            onChanged: (value){
              context.read<LoginBloc>().add(PasswordChanged(password: value));
            },
            validator: (value){
              if(value!.isEmpty){
                return 'Enter Password';

              }
              return null ;
            },
          );
        }
    );


  }
}
