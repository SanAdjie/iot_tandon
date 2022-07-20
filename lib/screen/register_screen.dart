import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_input.dart';
import 'package:iot_tandon/component/reusable_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget> [
            Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Daftar", style: kStyleHeader1),
                  const SizedBox(height: 20),
                  ReusableInput(label: "Name", rahasia: false, onChanged: (value){
                    print(value);
                    nama = value;
                  }, jenisKeyboard: "email"),
                  kSpasiInput,
                  ReusableInput(label: "Email", rahasia: false, onChanged: (value){
                    print(value);
                    password = value;
                  }, jenisKeyboard: "biasa"),
                  kSpasiInput,
                  ReusableInput(label: "Password", rahasia: true, onChanged: (value){
                    print(value);
                    password = value;
                  }, jenisKeyboard: "biasa"),
                  kSpasiInput,
                  ReusableInput(label: "Re-password", rahasia: true, onChanged: (value){
                    print(value);
                    repassword = value;
                  }, jenisKeyboard: "biasa"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Sudah Punya Akun ? "),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text("Login"))
                    ],
                  ),
                  ReusableButton(text: "Daftar", ontap: (){
                    //TODO : MASUKKAN SETSTATE
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
