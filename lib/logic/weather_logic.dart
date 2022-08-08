import 'package:iot_tandon/utility/location.dart';
import 'package:iot_tandon/utility/networking.dart';

class CuacaData{
  //Property
  late String latitude;
  late String longitude;

  LokasiCuaca lokasi = LokasiCuaca();

  //Constructor

  //Method
  Future getCuaca() async{
    await lokasi.getLocation();

    latitude = lokasi.latitude.toString();
    longitude = lokasi.longitude.toString();

    Network dataCuaca = Network('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=679dd247723a578e229d80420c74103e&units=metric');
    return dataCuaca.ambilData();
  }
}