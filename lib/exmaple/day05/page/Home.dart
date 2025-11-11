
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

class Home extends StatefulWidget{
  HomeState createState() =>HomeState();
}//class end

class HomeState extends State<Home>{

  @override
  void initState(){
    findAll();
  }
  List<dynamic>todoList = [];
  void findAll() async{
    try{
      final response = await dio.get("http://192.168.1.22:8080/api/todo");
      final data = await response.data;
      setState(() {todoList=data;});
    }catch(e){print(e);}
  }

  void delete(int id) async{
    try{
      final response = await dio.delete("http://192.168.1.22:8080/api/todo?id=${id}");
      final data = await response.data;
      if(data == true){findAll();}
    }catch(e){print(e);}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO"),),
      body: Center(
        child: Column(
          children: [
            Expanded(child: ListView(
              // children: [], //반복문 이용하여 ListView에 여러개 Card 대입
              // toList.map((반복변수명){return 반환위젯()}).toList();
              children: todoList.map((todo){ // map 반복문은 dynamic 타입 매핑 안된다.
                return Card(child: ListTile(
                  title:Text(todo['title']),
                  subtitle:Text(todo['content']),
                  trailing: Row( // Row : 가로 배치 위젯
                    mainAxisSize: MainAxisSize.min, //Row 배치에서 오른쪽 버튼(위젯)들의 넓이를 자동으로 최소 크기 할당
                    children: [

                      IconButton(onPressed: (){delete(todo['id']);}, icon: Icon(Icons.delete_forever_sharp)),
                      IconButton(
                          onPressed: (){
                            final result = Navigator.pushNamed(context, "/update",arguments:todo['id']);
                            // 만약에 push 한 위젯이 pop 했을때 반환값 받아서 특정 로직 구현
                            if(result==true){findAll();}
                            },
                          icon: Icon(Icons.edit_sharp)),
                      IconButton( // Navigator.pushNamed(context(현위젯),"{이동할경로}",arguments:{매개변수});
                          onPressed: (){Navigator.pushNamed(context, "/detail",arguments:todo['id'] );},
                          icon: Icon(Icons.info)),
                    ],
                  ),
                ),);
              }).toList(),//map end
            ))
          ],
        ),
      ),
    );
  }//func end
}//class end