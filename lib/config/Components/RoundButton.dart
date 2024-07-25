import 'package:bloc_mvvm_2/config/Color/Colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height ;

  const RoundButton({super.key,required this.title,required this.onPress,this.height = 40});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height:height ,
        decoration:const  BoxDecoration(
           color: AppColors.buttonColor
        ),
        child: Center(
           child: Text(title),
        ),
      ),
    );
  }
}



