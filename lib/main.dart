import 'package:Express/screens/noInternetPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'services/authentication.dart';
import 'screens/root_page.dart';
import 'screens/home.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      routes: {
        '/home': (context) => new Home(),
        '/noInternet': (context) => new NoInternetPage(),
      }));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Express',
      theme: ThemeData(
        primaryColor: Color(0xFF56CCF2),
        primaryColorLight: Color(0x7756CCF2),
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xFFE5E5E5),
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white,
              fontSize: scaler.getTextSize(8.0),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4),
          headline2: TextStyle(
              color: Colors.grey,
              fontSize: scaler.getTextSize(6.5),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.4),
          headline3: TextStyle(
              color: Color(0xFF56CCF2),
              fontSize: scaler.getTextSize(6.5),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.4),
          headline4: TextStyle(
              color: Colors.black,
              fontSize: scaler.getTextSize(6.5),
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2),
          headline5: TextStyle(
              color: Colors.white,
              fontSize: scaler.getTextSize(6.5),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4),
          headline6: TextStyle(
              color: Colors.black,
              fontSize: scaler.getTextSize(7.5),
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2),
          subtitle1: TextStyle(
              color: Colors.black,
              fontSize: scaler.getTextSize(8.5),
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2),
          subtitle2: TextStyle(
              color: Colors.black,
              fontSize: scaler.getTextSize(5.5),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2),
        ),
      ),
      home: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: AfterSplash(),
          image: new Image.asset('assets/images/logo.png'),
          backgroundColor: Colors.white,
          photoSize: 80.0),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RootPage(auth: new Auth());
  }
}
