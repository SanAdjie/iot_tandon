import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_input.dart';
import 'package:iot_tandon/component/reusable_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterScreen extends StatefulWidget {

  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late String nama;
  late String email;
  late String password;
  late String repassword;
  late final userBaru;

  final _akun = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget> [
            Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Daftar", style: kStyleHeader1),
                  kSpasi3,
                  ReusableInput(label: "Name", rahasia: false, onChanged: (value){
                    nama = value;
                  }, jenisKeyboard: "email"),
                  kSpasi2,
                  ReusableInput(label: "Email", rahasia: false, onChanged: (value){
                    email = value;
                  }, jenisKeyboard: "biasa"),
                  kSpasi2,
                  ReusableInput(label: "Password", rahasia: true, onChanged: (value){
                    password = value;
                  }, jenisKeyboard: "biasa"),
                  kSpasi2,
                  ReusableInput(label: "Re-password", rahasia: true, onChanged: (value){
                    repassword = value;
                  }, jenisKeyboard: "biasa"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Sudah Punya Akun ? "),
                      TextButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: const Text("Login"))
                    ],
                  ),
                  ReusableButton(text: "Daftar", ontap: () async{
                    try{
                      userBaru = await _akun.createUserWithEmailAndPassword(email: email, password: password);
                      Navigator.pop(context);
                    }
                    catch(e){
                      Alert(
                        context: context,
                        title: "Register Gagal",
                        desc: "Cek email dan password lagi.",
                        image: Image.asset("images/cakra2.png"),
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            color: kBGBiru,
                            radius: BorderRadius.circular(10.0),
                            child: const Text(
                              "Baik",
                              style: kStyleText3,
                            ),
                          ),
                        ],
                      ).show();
                    }
                  }),
                ],
              ),
            ),
          )],
        ),
      ),
    );
  }
}
