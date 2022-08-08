import 'package:flutter/material.dart';
import 'package:iot_tandon/component/reusable_customclipper.dart';
import 'package:iot_tandon/database/database.dart';
import 'package:iot_tandon/logic/distance_logic.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_card.dart';
import 'package:iot_tandon/component/reusable_carddetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CardDetailScreen extends StatefulWidget {

  static String id = "CardDetailScreen";

  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {

  //Property
  int dataJarak = 0;

  int arus = 0;
  double hum = 0;
  double jarak = 0;
  int relay1 = 0;
  int relay2 = 0;
  String temp = "-";

    //Snapshot Database
  final akun = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

    //JSON Database
  DatabaseIoT dataIoT = DatabaseIoT();

  //Method
  updateDataIoTJSON() async{
    var data = await dataIoT.getData();
    setState((){
      arus = data["Arus"]["data"];
      jarak = data["Jarak"]["data"];
      relay1 = data["Relay1"];
      relay2 = data["Relay2"];
      temp = data["Temp"]["data"].toString();
    });
  }

  @override
  void initState() {
    super.initState();
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
                                title: "Suhu", iconTrail: Icons.logout, description: "$temp°C", ontap: () async{
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
                        await updateDataIoTJSON();
                        setState((){
                          DistanceLogic dataAir = DistanceLogic(jarak, 100.0);
                          dataJarak = dataAir.outputVolume();
                        });
                      },)),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "", status: "ON ", icon: Icons.heat_pump, onPress: (){
                        //TODO : GET DATA RELAY (INIT)
                        //TODO : SET DATA RELAY (BERI ALERT)
                      })),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "", status: "OFF", icon: Icons.heat_pump, onPress: (){
                        //TODO : GET DATA RELAY (INIT)
                        //TODO : SET DATA RELAY (BERI ALERT)
                      }))
                ],
              )),
            GestureDetector(
              onTap: (){},
              child: Container(
                color: kBGBiru2,
                height: 50,
                child: const Center(
                  child: Text("Reset",
                    style: kStyleText4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
