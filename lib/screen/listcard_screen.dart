import 'package:flutter/material.dart';
import 'package:iot_tandon/component/reusable_customClipper.dart';
import 'package:iot_tandon/utility/const.dart';
import 'package:iot_tandon/component/reusable_card.dart';

class ListcardScreen extends StatefulWidget {

  static String id = "ListcardScreen";

  @override
  State<ListcardScreen> createState() => _ListCardState();
}

class _ListCardState extends State<ListcardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body:  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            title: "Suhu", iconTrail: Icons.logout, description: "25°C",),
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
              ) ,
              Expanded(
                flex: 6,
                child: Container()
              )
            ],
          ),
        )
    );
  }
}

