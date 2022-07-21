import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';

class ReusableCard extends StatelessWidget {

  late var iconLead;
  late var iconTrail;
  String title;
  String description;
  late Function()? ontap;

  ReusableCard({this.iconLead, required this.title, required this.description, this.iconTrail, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: ListTile(
        horizontalTitleGap: 10,
        iconColor: Colors.black87,
        textColor: kBGPutih,
        leading: iconLead,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text(description),
        trailing: GestureDetector(
            onTap: ontap,
            child: Icon(iconTrail, size: 30)),
      ),
    );
  }
}
