import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';

class ReusableContentListCard extends StatelessWidget {

  //Property
  final IconData namaIcon;
  final String label;

  //Constructor
  ReusableContentListCard({required this.namaIcon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(namaIcon, size: 80),
        kSpasi2,
        Text(label, style: kStyleText2,)
      ],
    );
  }
}

