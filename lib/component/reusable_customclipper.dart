import 'package:flutter/material.dart';

class CustomClipperSaya extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
      var path = Path();
      path.lineTo(0, size.height);
      var startSatu = Offset(size.width / 5, size.height);
      var endSatu = Offset(size.width / 2.25, size.height - 25.0);
      path.quadraticBezierTo(startSatu.dx, startSatu.dy, endSatu.dx, endSatu.dy);

      var startDua = Offset(size.width - (size.width/3.5), size.height-50);
      var endDua = Offset(size.width, size.height/3);
      
      path.quadraticBezierTo(startDua.dx, startDua.dy, endDua.dx, endDua.dy);
      path.lineTo(size.width, 0);
      path.close();
      return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}