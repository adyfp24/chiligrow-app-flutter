import 'package:chiligrow_app/services/service.dart';
import 'package:chiligrow_app/views/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chiligrow_app/providers/provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => SensorProvider(
            SensorService(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PemupukanProvider(
            PemupukanService(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chiligrow App',
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        home: SplashScreen(),
        routes: {
          // '/' : (context) => SplashScreen(),
          '/regist': (context) => RegisterPage(),
          '/regist-detail': (context) => DetailRegist(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(key: homepageKey),
          '/profile': (context) => ProfilePage(),
          '/riwayat-pemupukan': (context) => HistoryPemupukan(),
        },
      ),
    );
  }
}
