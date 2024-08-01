import 'package:bloc_mvvm_2/Services/storage/local_storage.dart';
import 'package:bloc_mvvm_2/config/Routes/Routes_name.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('HomeScreen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            LocalStorage localStorage = LocalStorage();
            localStorage.clearValue('token').then((value){
                  localStorage.clearValue('isLogin');
                  Navigator.pushNamed(context, RoutesName.loginScreen);
            });
          }, icon:const  Icon(Icons.logout))
        ],
      ),
      body:const  Column(
        children: [

        ],
      ),
    );
  }
}
