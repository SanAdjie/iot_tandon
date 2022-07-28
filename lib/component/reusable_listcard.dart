import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';

class ReusableListCard extends StatelessWidget {
  //Property
  final Widget? child;
  final Function()? onPress;
  final IconData? icon;

  //Constructor
  ReusableListCard({this.child, this.onPress, this.icon });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        decoration: BoxDecoration(
            color: kBGAbu2,
            borderRadius: BorderRadius.circular(10.0)),
        child: child
      ),
    );
  }
}