import 'package:flutter/material.dart';
import 'package:iot_tandon/utility/const.dart';

class ReusableButton extends StatelessWidget {

  final text;
  Function()? ontap;

  ReusableButton({@required this.text, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
            width: 153,
            height: 50,
            decoration: BoxDecoration(
                color: kBGBiru,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Center(
                child: Text(text,
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500))))
    );
  }
}


