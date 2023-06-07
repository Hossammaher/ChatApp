import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,required this.buttonName});
  
  String buttonName ;
  VoidCallback? onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.circular(8)

        ),
        child: Center(child: Text(buttonName,style: TextStyle(fontSize: 24),)),


      ),
    );
  }

  
}
