import 'package:flutter/material.dart';
import 'package:iot_tandon/screen/card_screen.dart';
import 'package:iot_tandon/screen/carddetail_screen.dart';
import 'package:iot_tandon/screen/loading_screen.dart';
import 'package:iot_tandon/screen/register_screen.dart';
import 'package:iot_tandon/screen/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IOT',
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.white,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.black),
            bodyText2: TextStyle(color: Colors.black)
          ),
      ),
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => LoadingScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        CardSreen.id: (context) => CardSreen(),
        CardDetailScreen.id: (context) => CardDetailScreen()
      },
    );
  }
}