import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:teste/pages/home_page.dart';

void main() async{
  
  await Hive.initFlutter();
  
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}