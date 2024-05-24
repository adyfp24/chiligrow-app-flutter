import 'package:chiligrow_app/services/service.dart';
import 'package:chiligrow_app/views/pages/page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chiligrow_app/providers/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import './utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        ),
        ChangeNotifierProvider(
          create: (_) => SimulasiProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chiligrow App',
        theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: kColorGreen)),
        home: SplashScreen(),
        routes: {
          // '/' : (context) => SplashScreen(),
          '/landing': (context) => LandingPage(),
          '/regist': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(key: homepageKey),
          '/profile': (context) => ProfilePage(),
          '/riwayat-pemupukan': (context) => HistoryPemupukan(),
          '/hasil-simulasi': (context) => HasilSimulasi(),
          '/forget': (context) => ForgetPage(),
          '/verify-otp':(context) => VerifyOtpPage(),
          '/reset-password': (context) => ResetPasswordPage()
        },
      ),
    );
  }
}
