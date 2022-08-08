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
import 'package:iot_tandon/logic/weather_logic.dart';


class ListcardScreen extends StatefulWidget {

  static String id = "ListcardScreen";

  @override
  State<ListcardScreen> createState() => _ListCardState();
}

class _ListCardState extends State<ListcardScreen> {

  String suhu = "-";
  String kondisiCuaca = "-";
  String cuacaLokasi = "-";
  LokasiCuaca lokasi = LokasiCuaca();
  CuacaData cuaca = CuacaData();

  updateDataCuaca() async{

    await lokasi.getLocation();
    var dataCuaca = await cuaca.getCuaca();

    setState(() {
      suhu = dataCuaca["main"]["temp"].toString();
      kondisiCuaca = dataCuaca['weather'][0]["main"].toString();
      cuacaLokasi = dataCuaca['name'];
    });
  }

  @override
  void initState(){
    super.initState();
    updateDataCuaca();
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
                  onTap: () async{
                    await updateDataCuaca();
                    setState((){
                      if(lokasi.error != null){
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
                      }
                    });
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
                              title: "Suhu ($cuacaLokasi)", iconTrail: Icons.logout, description: "$suhu°C",ontap: (){
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
                              title: "Cuaca ($cuacaLokasi)", description: kondisiCuaca,)
                          ],
                        ),
                        ),
                    ),
                      ClipPath(
                        clipper: CustomClipperSaya(),
                        child: Container(
                          color: kBGBayangan,
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
                              child: ReusableContentListCard(label: "Tandon Blitar", namaIcon: Icons.water))),
                          Expanded(child: ReusableListCard(onPress: (){},
                              child: ReusableContentListCard(label: "Kosong", namaIcon: Icons.add)))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(child: ReusableListCard(onPress: (){},
                              child: ReusableContentListCard(label: "Kosong", namaIcon: Icons.add))),
                          Expanded(child: ReusableListCard(onPress: (){},
                              child: ReusableContentListCard(label: "Kosong", namaIcon: Icons.add)))
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

