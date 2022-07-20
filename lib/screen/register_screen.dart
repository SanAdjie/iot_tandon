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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Daftar", style: kStyleHeader1),
                const SizedBox(height: 20),
                ReusableInput(label: "email", rahasia: false, onChanged: (value){}, jenisKeyboard: "email"),
                const SizedBox(height: 15),
                ReusableInput(label: "email", rahasia: false, onChanged: (value){}, jenisKeyboard: "biasa"),
                const SizedBox(height: 15),
                ReusableInput(label: "password", rahasia: true, onChanged: (value){}, jenisKeyboard: "biasa"),
                const SizedBox(height: 15),
                ReusableInput(label: "Re-password", rahasia: true, onChanged: (value){}, jenisKeyboard: "biasa"),
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
            )),
      ),
    );
  }
}
