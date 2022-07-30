import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  //Property
  final String url;
  var data;
  //Constructor

  Network(this.url);

  //Method
  Future ambilData() async{
    http.Response respon  = await http.get(Uri.parse(url));

    if(respon.statusCode == 200){
      data = respon.body;
      //TODO : DATA TERLALU SPESIFIK.
      //TODO : DATA PERLU DIAMBIL MELALUI STREAM (SNAPSHOT), BUKAN JSON.
      return JsonDecoder().convert(data)['Tandon_1']['Jarak']['data'];
    }else{
      print(respon.statusCode);
    }
  }

  getData() async{
    var x = await ambilData();
    print(x);
  }
}

