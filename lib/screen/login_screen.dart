import 'package:flutter/material.dart';
import 'package:iot_tandon/screen/listcard_screen.dart';
import 'package:iot_tandon/screen/register_screen.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_button.dart';
import 'package:iot_tandon/component/reusable_input.dart';

class LoginScreen extends StatefulWidget {

  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _RegisterState();
}

class _RegisterState extends State<LoginScreen> {

  late String email;
  late String password;

  @override
  void initState() {
    // TODO: Digunakan Untuk Cek User Login
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: kBGBiru,
                    borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 140))),
                    child: Center(
                      child: Image.asset("images/logoUM.png", width: 150, height: 120,),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text("Login", style: kStyleHeader1),
                      kSpasiInput,
                      ReusableInput(label: "Email", rahasia: false, onChanged: (value){
                        email = value;
                      }, jenisKeyboard: "email"),
                      kSpasiInput,
                      ReusableInput(label: "Password", rahasia: true, onChanged: (value){
                        password = value;
                      }, jenisKeyboard: "biasa"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Belum Punya Akun ? "),
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, RegisterScreen.id);
                          }, child: const Text("Daftar"))
                        ],
                      ),
                      ReusableButton(text: "Log In", ontap: (){
                        //TODO : LOGIN AUTH, ASYNC-AWAIT, TRY-CATCH
                        //TODO : MODAL PROGRESS HUD. Gagal : Alert
                        Navigator.pushNamed(context, ListcardScreen.id);
                      }),
                    ],
                  )),
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}