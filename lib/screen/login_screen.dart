import 'package:flutter/material.dart';
import 'package:iot_tandon/screen/listcard_screen.dart';
import 'package:iot_tandon/screen/register_screen.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_button.dart';
import 'package:iot_tandon/component/reusable_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class LoginScreen extends StatefulWidget {

  static String id = "LoginScreen";

  @override
  State<LoginScreen> createState() => _RegisterState();
}

class _RegisterState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  late String email;
  late String password;
  bool loading = false;

  final akun = FirebaseAuth.instance;
  late final user;

  late AnimationController controller;
  late Animation animasi;
  late num animasiValue;
  int animasiValueInt = 0;

  //cuaca.permission;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this,
      upperBound: 1
    );
    controller.forward(from: 0);
    animasi = CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
    controller.addListener((){
      setState((){
        animasiValue = animasi.value*500;
        animasiValueInt = animasiValue.toInt();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: ModalProgressHUD(
            inAsyncCall: loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: animasiValueInt*1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kBGBiru,
                      borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 140))),
                      child: Center(
                        child: Image.asset("images/logoUM.png", width: 150, height: 120,),
                      )),
                ),
                Expanded(
                  flex: 1000,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        kSpasi1,
                        Text("Login", style: kStyleHeader1),
                        kSpasi2,
                        ReusableInput(label: "Email", rahasia: false, onChanged: (value){
                          email = value;
                        }, jenisKeyboard: "email"),
                        kSpasi2,
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
                        ReusableButton(text: "Log In", ontap: () async{
                          setState((){
                            loading = true;
                          });
                          try{
                           user = await akun.signInWithEmailAndPassword(email: email, password: password);
                           if(user != null){
                             Navigator.pushNamed(context, ListcardScreen.id);
                           }
                          }
                          catch(e){
                            print(e);
                            setState((){
                              loading = false;
                            });
                            Alert(
                              context: context,
                              title: "Login Gagal",
                              desc: "Password atau Email yang kamu masukkan salah",
                              image: Image.asset("images/cakra.png"),
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
                    )),
                ),
                kSpasi3
              ],
            ),
          ),
        ),
      ),
    );
  }
}