import 'package:flutter/material.dart';

Widget getDashbaordCard({required String title, required String image}){
  return Container(

    child: Column(
    mainAxisAlignment:MainAxisAlignment.center,

    children: [
      Image.asset(image,
        height: 56,
        width: 56,

      ),
      SizedBox(height: 10,)
      ,Text(title,
      textAlign: TextAlign.center,
      style: TextStyle(

        color: Colors.black,fontSize: 15,fontWeight: FontWeight.w400
      ),
      )

    ],
  ),




    height: 150,
    width: 110,
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(15),
      border: Border.symmetric(),
    ),
  );
}