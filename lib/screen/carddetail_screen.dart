import 'package:flutter/material.dart';
import 'package:iot_tandon/component/reusable_customclipper.dart';
import 'package:iot_tandon/logic/distance_logic.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_card.dart';
import 'package:iot_tandon/component/reusable_carddetail.dart';
import 'package:iot_tandon/utility/networking.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CardDetailScreen extends StatefulWidget {

  static String id = "CardDetailScreen";

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {

  //Property
  int dataJarak = 0;

  final akun = FirebaseAuth.instance;

  //Method
  @override
  void initState() {
    super.initState();
    // TODO: AMBIL DATA CUACA
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Stack(
                    children: [
                      ClipPath(
                        clipper: CustomClipperSaya(),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.3,
                          color: kBGBiru,
                          child: Column(
                            children: <Widget>[
                              ReusableCard(iconLead: const Icon(Icons.device_thermostat, size: 40),
                                title: "Suhu", iconTrail: Icons.logout, description: "25°C", ontap: () async{
                                Navigator.pop(context);
                                },),
                              ReusableCard(iconLead: const Icon(Icons.sunny, size: 40),
                                title: "Cuaca", description: "Hujan",)
                            ],
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: CustomClipperSaya(),
                        child: Container(
                          color: const Color(0x26F3A953),
                          height: MediaQuery.of(context).size.height*0.11,
                        ),
                      )
                    ]
                )
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: const Text("Tandon Alpha", style: kStyleText1)),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "volume", status: "$dataJarak%", icon: Icons.opacity, onPress: () async{
                        Network dataRealtime = Network("https://tandon-iot-b75b0-default-rtdb.asia-southeast1.firebasedatabase.app/Tandon-IoT.json");
                        var dataVolume = await dataRealtime.ambilData();
                        setState((){
                          DistanceLogic dataAir = DistanceLogic(dataVolume, 210);
                          dataJarak = dataAir.outputVolume();
                        });
                      },)),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "", status: "ON ", icon: Icons.lunch_dining, onPress: (){
                        //TODO : GET DATA RELAY (INIT)
                        //TODO : SET DATA RELAY (BERI ALERT)
                      })),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "", status: "OFF", icon: Icons.memory, onPress: (){
                        //TODO : GET DATA RELAY (INIT)
                        //TODO : SET DATA RELAY (BERI ALERT)
                      }))
                ],
              ))
          ],
        ),
      ),
    );
  }
}
