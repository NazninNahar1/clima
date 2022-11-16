
import 'package:clima/servises/current_location.dart';
import 'package:http/http.dart'as http;

class WeatherData {
  late double latitude=0.0;
  late double longitude =0.0;

  Future getWeatherData() async{


    Location  l1 =Location();
    await l1.getCurrentLocation();
    latitude=l1.latitude;
    longitude=l1.longitude;

    var uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${latitude.round()}&lon=${longitude.round()}&appid=473542fad701f480032669e4191465f1');
    var response = await http.get(uri);
    if(response.statusCode==200){
      String data = response.body;

      // var id = jsonDecode(data)['weather'][0]['id'];
      // var temperature = jsonDecode(data)['main']['temp'];
      // var name = jsonDecode(data)['name'];

    return data;
      // print(id);
      // print(temperature);
      // print(name);
      // print(latitude);
      // print(longitude);
    }else {
      print(response.statusCode);
    }


  }

}