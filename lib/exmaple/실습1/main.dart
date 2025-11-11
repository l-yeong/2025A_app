import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tj2025a_app/exmaple/day02/example3.dart';

// 프로그램 실행 시작점
void main(){runApp(MyApp());}//func end

// 앱 전체 루트 위젯 정의
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/", //앱 시작 하는 최초의 경로지정
      routes:{
        // "/": (context) =>
      },
    );
  }//func end
}//class end