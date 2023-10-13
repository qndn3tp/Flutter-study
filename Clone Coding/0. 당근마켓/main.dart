import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());    // 앱을 실행 (앱의 메인페이지)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text("금호동3가", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
            elevation: 0,
            actions: [Icon(Icons.search), Icon(Icons.menu), Icon(Icons.notifications_none)]),
        body: Container(
          height: 100,
          margin: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(  // 상품 이미지
                width: 200,
                color: Colors.white,
                child: Image.asset("assets/camera.jpg"),
              ),
              Expanded(  // 상품 소개글
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("캐논 DSLR 100D (단렌즈, 충전기 16기가 SD 포함)", style: TextStyle(fontSize: 16),),
                      SizedBox(height: 5,),     //  Text 위젯 사이 여백을 주기 위함
                      Text("달서구 상인동 * 끌올 10분 전", style: TextStyle(color: Colors.grey, fontSize: 14),),
                      SizedBox(height: 5,),     //  Text 위젯 사이 여백을 주기 위함
                      Text("50000원", style: TextStyle(fontSize: 14),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border), Text("4")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
            ),
          ),
        )
    );
  }
}
