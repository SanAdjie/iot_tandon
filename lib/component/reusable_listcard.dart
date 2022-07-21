import 'package:flutter/material.dart';

class ReusableListCard extends StatelessWidget {
  //Property
  final Widget? child;
  final Function()? onPress;

  //Constructor
  ReusableListCard({this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: Color(0xFFF2F3F3),
            borderRadius: BorderRadius.circular(10.0)),
        child: child,
      ),
    );
  }
}