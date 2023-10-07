import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Color(0xffFAFAFA),
          iconTheme: IconThemeData(color: Colors.blueAccent),
          title: Text("< 목록", style: TextStyle(color: Color(0xff2478FF), fontSize: 17),),
          elevation: 0,
          actions: [Icon(Icons.add)],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // icloud 연락처
            Container(
              margin: EdgeInsets.only(left: 20),
              color: Color(0xffFAFAFA),
              child: Text("연락처", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),),
            ),
            // 검색
            Container(
              width: double.infinity,
              height: 35,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
              decoration: BoxDecoration(
                color: Color(0xffE4E4E4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xffE4E4E4), width: 3)
              ),
              child: Row(
                children: [ Icon(Icons.search, color: Color(0xff757575),),
                            Text("검색", style: TextStyle(color: Color(0xff757575)),)
                ],
              ),
            ),
            // 구분선
            DivisionLine(),
            // 내 프로필
            Container(
              margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
              height: 60,
              child: Row(
                children: [Image.asset("assets/profile_image.jpg"),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("김건혜", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),),
                      Text("내 카드", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Color(0xff757575)))
                      ],
                    )
                  )],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top:25, right: 0, bottom: 0),
              child: Text("ㅎ", style: TextStyle(fontSize: 16, color: Color(0xff757575)),),
            ),
            // 연락처 리스트
            Container(
              child: Column(
                children: [
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                  ContactList(),
                ],
              )
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}


// 하단바 위젯
class BottomAppBar extends StatelessWidget {
  const BottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF6F6F6),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // 즐겨찾기
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Color(0xff757575),),
                Text("즐겨찾기", style: TextStyle(fontSize: 10, color: Color(0xff757575)),)
              ],
            ),
          ),
          // 최근 통화
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.watch_later, color: Color(0xff757575),),
                Text("최근통화", style: TextStyle(fontSize: 10, color: Color(0xff757575)),)
              ],
            ),
          ),
          // 연락처
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, color: Color(0xff2478FF),),
                Text("연락처", style: TextStyle(fontSize: 10, color: Color(0xff2478FF)),)
              ],
            ),
          ),
          // 키패드
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.apps, color: Color(0xff757575),),
                Text("키패드", style: TextStyle(fontSize: 10, color: Color(0xff757575)),)
              ],
            ),
          ),
          // 음성사서함
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.radio, color: Color(0xff757575),),
                Text("음성사서함", style: TextStyle(fontSize: 10, color: Color(0xff757575)),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 구분선 위젯
class DivisionLine extends StatelessWidget {
  const DivisionLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1,
        margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
        color: Color(0xffE4E4E4)
    );
  }
}

// 연락처 위젯
class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DivisionLine(),
          Container(
            margin: EdgeInsets.only(left: 20, top:7, right: 0, bottom: 0),
            child: Text("홍길동",),
          ),
        ],
      ),
    );
  }
}
