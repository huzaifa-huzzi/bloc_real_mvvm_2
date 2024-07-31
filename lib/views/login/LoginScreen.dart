import 'package:bloc_mvvm_2/Repository/Auth/login_repository.dart';
import 'package:bloc_mvvm_2/bloc/login_bloc.dart';
import 'package:bloc_mvvm_2/views/login/Widgets/EmailInputWidget.dart';
import 'package:bloc_mvvm_2/views/login/Widgets/LoginButton.dart';
import 'package:bloc_mvvm_2/views/login/Widgets/PasswordInputWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
     late LoginBloc _loginBlocs;

     @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBlocs = LoginBloc(loginRepository: LoginRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login Page'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:BlocProvider(
          create: (_) => _loginBlocs,
        child: Form(
          key: _formKey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailInputWidget(emailFocusNode: emailFocus),
              const SizedBox(height: 20,),
              PasswordInputWidget(passwordFocusNode: passwordFocus),
              const SizedBox(height: 20,),
              LoginWidgetButton(formKey: _formKey,),
            ],
          ),
        ) ,
      ),


    );
  }
}
