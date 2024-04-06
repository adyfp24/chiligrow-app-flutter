import 'package:chiligrow_app/views/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:chiligrow_app/views/fragments/fragment.dart';
import './utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(
        key: homepageKey,
      ),
      // routes: {
      //   "/penyiraman" : (context)=> PenyiramanFragment(),
      // },
    );
  }
}
