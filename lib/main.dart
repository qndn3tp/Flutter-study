import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

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

  // 권한을 받았는지 확인하는 함수
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print("허락됨");
    } else if (status.isDenied) {
      print("거절됨");
      Permission.contacts.request();  // 허락해달라고 팝업을 띄움
    }
  }

  var total = 3;
  var name = ["김영숙", "홍길동", "피자집"];
  var like = [0, 0, 0];

  // total을 1씩 증가시키는 함수
  addOne() {
    setState(() {
      total++;
    });
  }
  // 모달창에서 입력한 이름을 추가하는 함수
  addName(string) {
    setState(() {
      name.add(string);
    });
  }
  // 연락처를 리스트에서 삭제하는 함수
  removeName(index) {
    setState(() {
      name.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context){
                return DialogUI( addOne: addOne, addName: addName);
              }
          );
        },
      ),
      appBar: AppBar(title: Text("연락처"),actions: [
        IconButton(onPressed: (){ getPermission(); }, icon: Icon(Icons.contacts))
      ],),
      body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (c, i){
            return ListTile(
              leading: Image.asset("assets/profile.png"),
              title: Text(name[i]),
              trailing: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Color(0xffE56A5D)),
                        )
                    )
                ),
                child: Text("삭제", style: TextStyle(color: Color(0xffE56A5D)),),
                onPressed: () {
                  removeName(i);
                },
              ),
            );
          }
      ),
    );
  }
}

// FAB 클릭 모달창 디자인
class DialogUI extends StatelessWidget {
  DialogUI({super.key, this.addOne, this.addName});

  final addOne;     // 부모위젯의 state인 total을 변경하는 함수
  var inputData = TextEditingController();  // 입력한 텍스트를 저장하기 위함
  final addName;

  @override
 // State<DialogUI> createState() => _DialogUIState();
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("연락처"),
      content: TextField( controller: inputData,),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text("취소"), onPressed: (){ Navigator.pop(context); },
            ),
            TextButton(
              child: Text("완료"), onPressed: (){
                if (inputData.text.trim() != "") {  // 공백인 입력은 리스트에 추가 X
                  addName(inputData.text);
                }
                Navigator.pop(context);
                },
            )
          ],
        )
      ],
    );
  }
}