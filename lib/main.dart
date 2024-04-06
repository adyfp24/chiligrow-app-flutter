import 'package:chiligrow_app/views/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chiligrow_app/providers/provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SensorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chiligrow App',
        theme: ThemeData(),
        home: HomePage(
          key: homepageKey,
        ),
      ),
    );
  }
}
