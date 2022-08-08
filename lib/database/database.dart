import 'package:iot_tandon/utility/networking.dart';

class DatabaseIoT{

  Future getData(){
    /*=========JSON REALTIME DATABASE=========*/
    Network dataIoT = Network('https://tandon-iot-b75b0-default-rtdb.asia-southeast1.firebasedatabase.app/Tandon-IoT.json');

    return dataIoT.ambilData();
  }
}