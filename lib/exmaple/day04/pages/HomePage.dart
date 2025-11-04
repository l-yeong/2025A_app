import 'package:flutter/material.dart';
import 'package:tj2025a_app/exmaple/day04/pages/HomePage.dart';


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("더조은:앱"),),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, "/detail");},
            child:Text("특정페이지 이동")),
      ),
    );
  }
}