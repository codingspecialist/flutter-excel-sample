import 'dart:io';

import 'package:excel_app/user.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("상호명 : ${userList[index].companyName}"),
            subtitle: Text("고객명 : ${userList[index].customerName}"),
            trailing: Text("전화번호 : ${userList[index].phoneNumber}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 1. 파일 Picker (디바이스 모든 곳에 접근 가능)
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            // 2. 파일 읽어서 엑셀로 변환
            File file = File(result.files.single.path!);
            var bytes = file.readAsBytesSync();
            var excel = Excel.decodeBytes(bytes);

            // 3. excel sheet 순회 (key는 sheet명, value는 sheet객체)
            excel.tables.forEach((key, value) {
              // sheet는 행과 열 데이터 == table
              List<List<Data?>> table = value.rows;

              for (int i = 0; i < table.length; i++) {
                // 4. 첫 row는 칼럼값이라 skip
                if (i == 0) continue;
                // 5. 엑셀데이터 User 객체에 옮기기
                userList.add(User.loadExcel(table[i]));
              }
            });
            Logger().d(userList[0]);
            setState(() {}); // 상태변경
          } else {
            Logger().d("파일 로드 실패");
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
