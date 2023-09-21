import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: MyApp(),
  )
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = ["김영숙", "홍길동", "피자집"];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
                return DialogUI();
              }
          );
        },
      ),
      appBar: AppBar(title: Text("연락처앱"),),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (c, i){
            return ListTile(
              leading: Image.asset("assets/profile.png"),
              title: Text(name[i]),
            );
          }
      ),
    );
  }
}

// FAB 클릭 모달창 디자인
class DialogUI extends StatefulWidget {
  const DialogUI({super.key});

  @override
  State<DialogUI> createState() => _DialogUIState();
}

class _DialogUIState extends State<DialogUI> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("연락처"),
      content: TextField(),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text("취소"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text("완료"),
              onPressed: (){
              },
            )
          ],
        )
      ],
    );
  }
}
