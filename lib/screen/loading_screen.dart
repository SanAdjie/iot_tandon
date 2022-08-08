import 'package:flutter/material.dart';
import 'package:iot_tandon/screen/login_screen.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:firebase_core/firebase_core.dart';

class LoadingScreen extends StatefulWidget {

  static String id = "LoadingScreen";

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState(){
    super.initState();

    Firebase.initializeApp().whenComplete((){
      print("Selesai 🌚 : Firebase-Initialize");
      setState((){});
    });

    Future.delayed(const Duration(seconds: 5), () async{
      Navigator.popAndPushNamed(context, LoginScreen.id);}
    );
  }

  @override
  void deactivate(){
    super.deactivate();
    print("Dada 😘 : LoadingScreen-Deleted");
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBGBiru,
      child: Center(
        child: Image.asset("images/logoUM.png", width: 230, height: 200))
    );
  }
}
