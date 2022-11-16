import 'package:clima/servises/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:clima/servises/current_location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getLocationWeatherData();
    super.initState();
  }

  void getLocationWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();

    WeatherData weather = WeatherData();
    var weatherData = weather.getWeatherData();

    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData,)));
    });
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
        child: const Center(
            child: SpinKitCircle(
          size: 200,
          color: Colors.white,
        )),
      ),
    );
  }
}
