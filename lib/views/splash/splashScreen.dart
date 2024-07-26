import 'package:bloc_mvvm_2/Services/SplashServices.dart';
import 'package:flutter/material.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

   SplashServices splashServices = SplashServices();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('splash screen'),
      ),
      body: TextButton(onPressed: (){}, child:const  Text('Home')),
    );
  }
}
