import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import "package:contacts_service/contacts_service.dart";

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
    PermissionStatus status = await Permission.contacts.status;
    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
    if (status.isGranted) {
      print("허락됨");
      List<Contact> contacts = await ContactsService.getContacts();  // 실제 연락처 정보를 받아옴

      setState(() {         // 받아온 연락처를 리스트(name)에 저장. state를 변경함
        name = contacts;
      });

    } else if (status.isDenied) {
      print("거절됨");
      Permission.contacts.request();  // 권한을 허락해달라고 팝업을 띄움
    }
  }

  List<Contact> name = [];

  // 사용자 입력을 받아 연락처에 추가해주는 함수
  addName(lastName, firstName, number) async {
    // 실제 연락처에 추가
    Contact newPerson = await Contact();
    newPerson.familyName = lastName;
    newPerson.givenName = firstName;
    newPerson.phones = [ Item(label: "mobile", value: number) ];

    ContactsService.addContact(newPerson);
  }

  // 연락처를 리스트에서 삭제하는 함수
  removeName(index) {
    ContactsService.deleteContact(name[index]);
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
                return DialogUI( addName: addName);
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
              title: Text(name[i].displayName ?? "이름 없음"),
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
  DialogUI({super.key, this.addName});

  var inputData1 = TextEditingController();  // 입력한 텍스트를 저장하기 위함. Last Name 저장
  var inputData2 = TextEditingController();  // First Name 저장
  var inputData3 = TextEditingController();  // 전화번호 저장
  final addName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("연락처"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text("  성  :"),
              SizedBox( width: 10,),
              Flexible(
                child: SizedBox(
                  height: 50,
                  child: TextField( controller: inputData1,
                  decoration: InputDecoration(
                    hintText: "성을 입력해주세요",
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    // 기본 상태
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(25),),
                    // 커서 찍혔을 때
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.black12, width: 3,),
                      borderRadius: BorderRadius.circular(25),),
                  ),
                ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("이름:"),
              SizedBox( width: 10,),
              Flexible(
                child: SizedBox(
                  height: 50,
                  child: TextField( controller: inputData1,
                    decoration: InputDecoration(
                      hintText: "이름을 입력해주세요",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      // 기본 상태
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),),
                      // 커서 찍혔을 때
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.black12, width: 3,),
                        borderRadius: BorderRadius.circular(25),),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("번호:"),
              SizedBox( width: 10,),
              Flexible(
                child: SizedBox(
                  height: 50,
                  child: TextField( controller: inputData1,
                    decoration: InputDecoration(
                      hintText: "번호를 입력해주세요",
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      // 기본 상태
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25),),
                      // 커서 찍혔을 때
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( color: Colors.black12, width: 3,),
                        borderRadius: BorderRadius.circular(25),),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text("취소"), onPressed: (){ Navigator.pop(context); },
            ),
            TextButton(
              child: Text("완료"), onPressed: (){
              // 성, 이름, 번호가 모두 입력되면 연락처에 추가
              if (inputData1.text.trim() != "") {
                if (inputData2.text.trim() != "") {
                  if (inputData3.text.trim() != "") {
                    addName(inputData1.text, inputData2.text, inputData3.text);}}}
              else {
                showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog( title: Text("성, 이름, 번호를 모두 입력해주세요"),);});}
              Navigator.pop(context);
            },
            )
          ],
        )
      ],
    );
  }
}