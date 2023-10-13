import 'package:flutter/material.dart';

var theme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.grey.shade100,
    elevation: 0,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
    actionsIconTheme: IconThemeData(color: Colors.black),
  ),
);


var removeButton = ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Color(0xffE56A5D)),
        )
    ),
);

var removeButtonText = TextStyle(color: Color(0xffE56A5D));

var inputText = InputDecoration(
  hintText: "입력해주세요",
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
);

var completeButton = ButtonStyle(
  shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Color(0xff81C784)),
      )
  ),
  backgroundColor: MaterialStateProperty.all(Color(0xff81C784)),
);

var completeButtonText = TextStyle(
  color: Colors.white
);

var cancleButton = ButtonStyle(
  shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: Color(0xffB4B4B4)),
      )
  ),
);

var cancleButtonText = TextStyle(
  color: Colors.black
);