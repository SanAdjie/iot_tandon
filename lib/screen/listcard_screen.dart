import 'package:flutter/material.dart';
import 'package:iot_tandon/component/reusable_contentlistcard.dart';
import 'package:iot_tandon/component/reusable_customclipper.dart';
import 'package:iot_tandon/screen/carddetail_screen.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_card.dart';
import 'package:iot_tandon/component/reusable_listcard.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:iot_tandon/screen/login_screen.dart';
import 'package:iot_tandon/utility/location.dart';


class ListcardScreen extends StatefulWidget {

  static String id = "ListcardScreen";

  @override
  State<ListcardScreen> createState() => _ListCardState();
}

class _ListCardState extends State<ListcardScreen> {

  LokasiCuaca cuaca = LokasiCuaca();

  @override
  void initState() {
    super.initState();

    cuaca.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: (){
                      if(cuaca.error != null){
                        setState(() {
                          cuaca.getLocation();
                          //TODO : ALERT PERLU DIBUAT DIREFAKTOR
                          Alert(
                            context: context,
                            title: "GPS Gagal",
                            desc: "Aktifkan GPS dan Izinkan Aplikasi Menggunakan GPS",
                            image: Image.asset("images/cakra4.png"),
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
                        });
                      }
                  },
                  child: Stack(
                    children: [
                      ClipPath(
                      clipper: CustomClipperSaya(),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        color: kBGBiru,
                        child: Column(
                          children: <Widget>[
                            ReusableCard(iconLead: Icon(Icons.device_thermostat, size: 40),
                              title: "Suhu", iconTrail: Icons.logout, description: "25°C",ontap: (){
                                Alert(
                                  context: context,
                                  title: "Tunggu!",
                                  desc: "Kamu yakin ingin keluar ?",
                                  image: Image.asset("images/cakra3.png"),
                                  buttons: [
                                    DialogButton(
                                        onPressed: () => Navigator.pop(context),
                                        color: kBGBiru,
                                        child: const Text( "Engga", style: kStyleText3)),
                                    DialogButton(
                                        onPressed: () => Navigator.popAndPushNamed(context, LoginScreen.id),
                                        color: kBGAbu3,
                                        child: const Text( "Yap", style: kStyleText3)),
                                  ],
                                ).show();
                              },),
                            ReusableCard(iconLead: Icon(Icons.sunny, size: 40),
                              title: "Cuaca", description: "Hujan",)
                          ],
                        ),
                        ),
                    ),
                      ClipPath(
                        clipper: CustomClipperSaya(),
                        child: Container(
                          color: Color(0x26F3A953),
                          height: MediaQuery.of(context).size.height*0.11,
                        ),
                      )
                    ]
                  ),
                )
              ),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
                        child: Text("Main Menu ", style: kStyleText1)),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(child: ReusableListCard(onPress: (){
                            //TODO: DETAIL TANDON - Perlu Data Masing2
                            Navigator.pushNamed(context, CardDetailScreen.id);
                          },
                              child: ReusableContentListCard(label: "Tandon Alpha", namaIcon: Icons.water))),
                          Expanded(child: ReusableListCard(onPress: (){
                            Navigator.pushNamed(context, CardDetailScreen.id);
                            //TODO: DETAIL TANDON - Perlu Data Masing2
                          },
                              child: ReusableContentListCard(label: "Tandon Beta", namaIcon: Icons.water)))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(child: ReusableListCard(onPress: (){
                            Navigator.pushNamed(context, CardDetailScreen.id);
                            //TODO: DETAIL TANDON - Perlu Data Masing2
                          },
                              child: ReusableContentListCard(label: "Tandon Charlie", namaIcon: Icons.water))),
                          Expanded(child: ReusableListCard(onPress: (){
                            Navigator.pushNamed(context, CardDetailScreen.id);
                            //TODO: DETAIL TANDON - Perlu Data Masing2
                          },
                              child: ReusableContentListCard(label: "Tandon Delta", namaIcon: Icons.water)))
                        ],
                      ),
                    ),
                  ],
                )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

