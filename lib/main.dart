/*
  main 
  login
  login panel
*/

import 'package:flutter/material.dart';
import 'package:flutter_login/login.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      theme: ThemeData(
          splashColor: Colors.black,
          highlightColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.white)),
    );
  }
}
