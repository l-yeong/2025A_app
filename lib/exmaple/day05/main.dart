

import 'package:flutter/material.dart';
import 'package:tj2025a_app/exmaple/day05/page/Detail.dart';
import 'package:tj2025a_app/exmaple/day05/page/Home.dart';
import 'package:tj2025a_app/exmaple/day05/page/Update.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context)=>Home(),
        "/detail":(context)=>Detail(),
        "/update":(context)=>Update(),
      },
      // routes: {"경로정의": (context)=>위젯명},

    );
  }
}