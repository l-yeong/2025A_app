// [*] 상태(state) 있는 위젯
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  // 1.상태가 있는 위젯 상속받기
  // (1) extends StatefulWidget 위젯으로 부터 상속 받는다.
  // (2) 상태를 관리할 하위 위젯들을 등록 한다.
  // * 하위 위젯들은 extends State<상위위젯>
  // 등록할위젯명 createState() => 등록할위젯명();
  MyAppState createState() => MyAppState();
}

void main() {
  runApp(MyApp());
}

// 2. 상태를 사용하는 위젯 선언
class MyAppState extends State<MyApp> {
  int count = 0; // 변수
  // +++++++++상태 변경 / 재 렌더링 ++++++++++++++
  // setState((){새로운값;})
  void increment() {setState(() {count++;});print(count);}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("상단바")),
          body: Center(
            child: Column(
              children: [
                Text("count : ${count}"),
                TextButton(onPressed: increment, child: Text("버튼"))
              ],
            ),
          ),
      ),
    );
  }

}