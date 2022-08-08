import 'package:geolocator/geolocator.dart';

class LokasiCuaca {

  //Property
  late LocationPermission permission;
  late bool gpsAktif;

  late double latitude;
  late double longitude;

  String? error = null;

  //Method
  void getLocation() async {
    try{
      gpsAktif = await Geolocator.isLocationServiceEnabled();
      if (!gpsAktif) {
        throw "Location services are disabled.";
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw "'Location permissions are denied";
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied, we cannot request permissions.';
      }

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
      print(latitude);
      print(longitude);
    }
    catch(e){
      print(e);
      error = e.toString();
    }
    }
  }





