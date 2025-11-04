import 'package:flutter/material.dart';

void main (){runApp(MyApp());}

// [1] 플로터 앱의 시작점 위젯
class MyApp extends StatelessWidget{ // StatelessWidget 상속 받으면 build 함수 재정의
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:IOwidget(),);
  }//func end
}//class end

// [2] 상태가 있는 위젯
class IOwidget extends StatefulWidget{ // StatefulWidget 상속받으면 createState 함수 재정의
  // 현재 위젯을 상속받은 하위 위젯들을 등록
  IOwidgetState createState()=>IOwidgetState();
}//class end

// -TextField 로 부터 입력받은 값들을 제어하는 제어 변수
TextEditingController nameCont = TextEditingController(); //입력받은 값들을 가지고 있는
TextEditingController ageCont = TextEditingController(); //입력받은 값들을 가지고 있는

// 버튼 함수
void onSave(){
  print(nameCont.text); //컨트롤러명.text : 현재 입력받은 값을 반환
  print(ageCont.text);
}//func end

// [3] 상태 하위 위젯
class IOwidgetState extends State<IOwidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title:Text("입출력 실습")),
      body:Column(children: [
        TextField(controller: nameCont,),
        TextField(controller: ageCont, decoration: InputDecoration(labelText:"나이 입력" ),),
        TextButton(onPressed: onSave, child: Text("등록"))
      ],) ,
    );
  }//func end
}//class end