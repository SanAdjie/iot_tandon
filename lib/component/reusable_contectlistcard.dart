import 'package:flutter/material.dart';

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
        SizedBox(height: 10),
        Text(label, style: TextStyle(fontSize: 18.0),)
      ],
    );
  }
}

