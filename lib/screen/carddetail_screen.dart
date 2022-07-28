import 'package:flutter/material.dart';
import 'package:iot_tandon/component/reusable_customclipper.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_card.dart';
import 'package:iot_tandon/component/reusable_carddetail.dart';

class CardDetailScreen extends StatefulWidget {

  static String id = "CardDetailScreen";
  @override
  State<CardDetailScreen> createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
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
                              ReusableCard(iconLead: Icon(Icons.device_thermostat, size: 40),
                                title: "Suhu", iconTrail: Icons.logout, description: "25°C",ontap: (){
                                  Navigator.pop(context);
                                  //TODO : AUTH LOGOUT
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
                )
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Text("Tandon Alpha", style: kStyleText1)),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "volume", status: "59%", icon: Icons.opacity,)),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "", status: "ON ", icon: Icons.lunch_dining,)),
                  Expanded(
                      child: ReusableCardDetail(tulisanBawah: "", status: "OFF", icon: Icons.memory,))
                ],
              ))
          ],
        ),
      ),
    );
  }
}
