import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';

class ReusableCardDetail extends StatelessWidget {
  //Property
  final Widget? child;
  final IconData icon;
  final Function()? onPress;
  final String tulisanBawah;
  final String status;

  //Constructor
  ReusableCardDetail({this.child, this.onPress, required this.icon, required this.tulisanBawah, required this.status});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        decoration: BoxDecoration(
            color: kBGAbu2,
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Icon(icon, size: 50,),
                    kSpasi1,
                    Text("Ketinggian Air")
                  ],
                ),
                Text("Status : "),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(status, style: kStyleHeader1,),
                    Text(tulisanBawah)
                  ],
                )
              ]
          ),
        ),
      ),
    );
  }
}