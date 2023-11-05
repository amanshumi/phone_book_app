import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_app/view/contactform.dart';
import 'package:phone_book_app/view/detail.dart';
import 'package:phone_book_app/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
