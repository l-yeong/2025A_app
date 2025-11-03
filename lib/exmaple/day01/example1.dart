// 1. void main(){} 이용한 최초 실행 코드 작성 한다.
// 2. 위젯 작성한다. 위젯이란? 화면을 구성하는 가상 작은 단위( == 컴포넌트 )

// [1] 위젯 만들기
// (1) StatelessWidget 상속 받는다.
// (2) build 함수 재구현 한다
// (3) build 함수의 return 에 'MaterialApp' 반환 한다
// (4) main() 안에서 취초로 실행할 위젯
import 'package:flutter/material.dart';

class MyApp1 extends StatelessWidget {
  // extends 이란 ? 특정 클래스로부터 물려받는 행위
  // 오버라이딩 @override, 빈 공간에 CTL+Space bar, build 함수
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Text("안녕하세요"));
  } //build end
} // func end

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 자바 : new 클래스명(매개변수) vs DART : 클래스명(속성명:값)
    // return MaterialApp(home: 출력할 위젯 ,)
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("여기에 상단바")), // 상단바
        body: Center(child: Text("여기가본문(코드수정)")), // 본문
        bottomNavigationBar: BottomAppBar(child: Text("여기가 하단바")), //하단바
      ), //scaffold end
    ); //material end
  }//build end
}//func end

void main() {
  // public static void main(){} 와 비슷한 main스레드 갖는다.
  print("dart 입니다."); // System.out.print() 와 비슷한 출력 함수
  // runApp(MyApp1()); // runApp(최초로실행할위젯)// 최초로 실행되는 위젯 실행
  runApp(MyApp2());
}

// main 함수명, 자바와 비슷하게 최초 실해은 void main 시작된다.
