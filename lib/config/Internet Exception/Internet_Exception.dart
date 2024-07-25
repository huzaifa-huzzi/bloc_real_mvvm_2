import 'package:bloc_mvvm_2/config/Color/Colors.dart';
import 'package:flutter/material.dart';


class InternetException extends StatelessWidget {
  final VoidCallback onPress;
  const InternetException({super.key,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox(height:  MediaQuery.sizeOf(context).height * .15,),
        const  Icon(
          Icons.cloud_off,
          color: AppColors.redColor,
          size: 50,
        ),
        Padding(
            padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              'We are unable to show results.\n Please check your data\nconnection',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
            ),
          ),

        ),
        ElevatedButton(onPressed:onPress, child: Center(
          child: Text('RETRY',style: Theme.of(context).textTheme.bodySmall,),
        ))
      ],
    );
  }
}
