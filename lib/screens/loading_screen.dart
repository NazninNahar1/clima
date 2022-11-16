import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart'as http;



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);





  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  var isLoaded = false;
  late double latitude;
  late double longitude;
  late Position position;

  @override
  void initState() {
    getLocation();

    super.initState();
  }


  Future getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
    latitude=position.latitude;
    longitude=position.longitude;
    setState(() {
      isLoaded=true;
    });


  }

  void getData() async{
    var uri = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=473542fad701f480032669e4191465f1');
    var response = await http.get(uri);
    print(response.body);


  }




  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('images/background.jpg'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  getLocation();
                  getData();
              },
                child: const Text(
                  'Location',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              Visibility(
                visible: isLoaded,
                replacement: const Center(child: CircularProgressIndicator(),),
                child: Center(
                  child:  Text(' Latitude is: ${position.latitude.round()}  Longitude is: ${position.longitude.round()}',style: const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold),

                ),

              ),
              ),


            ],
          ),



        ),
      ),
    );
  }
}
