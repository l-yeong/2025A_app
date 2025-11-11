
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
final dio=Dio();

class Detail extends StatefulWidget{
  DetailState createState() => DetailState();
}//class end

class DetailState extends State<Detail>{

  // 1. 해당 위젯이 최로로 열렸을때 함수 < 랜더링 >
  @override void initState(){}
  // 2. 이전(부모) 위젯이 변경 되었을때 실행 함수, <렌더링>
  @override void didChangeDependencies(){
    // 부모 위젯에서 상세버튼 누를때 마다 서로 다른 매개변수를 가져 온다
    // ModalRoute.of(context)!.settings.arguments as 타입
    int id = ModalRoute.of(context)!.settings.arguments as int;
    findById(id);
  }

  // 3. spring 서버로 부터 개별 조회 한다.
  dynamic todo = {};
  void findById(int id) async{
    try{
      final response = await dio.get("http://192.168.1.22:8080/api/todo/detail?id=${id}");
      final data = await response.data;
      setState(() {todo=data;});
    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("todo상세")),
      body: Padding(padding: EdgeInsets.fromLTRB(30,30,30,30), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //새로 배치 방법에서 왼쪽 정렬
        children: [
          Text("제목: ${todo['title']}",style: TextStyle(fontSize: 20),),
          SizedBox(height: 10),
          Text("내용: ${todo['content']}",style: TextStyle(fontSize: 18,color: Colors.pink)),
          SizedBox(height: 20),

          Text("완료 여부: ${todo['done'] ==true ? '완료':'미완료'}",style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          Text("등록일: ${todo['createDate']}",style: TextStyle(fontSize: 18),),
        ],
      ),
      )
    );
  }
}//class end