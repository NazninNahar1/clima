// import 'package:clima/servises/weather_data.dart';
// import 'package:flutter/material.dart';
// import 'package:clima/servises/current_location.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'location_screen.dart';
//
//
//
// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key? key}) : super(key: key);
//
//
//
//
//   @override
//   State<LoadingScreen> createState() => _LoadingScreenState();
// }
//
// class _LoadingScreenState extends State<LoadingScreen> {
//
//   bool isLoaded = false;
//   late double latitude=0.0;
//   late double longitude=0.0;
//
//
//   @override
//   void initState() {
//     getLocation();
//     super.initState();
//   }
//
//
//   void getLocation() async {
//     Location location = Location();
//     await location.getCurrentLocation();
//     latitude= location.latitude;
//     longitude =location.longitude;
//     setState(() {
//       isLoaded=true;
//     });
//   }
//
//   void getData() async{
//     WeatherData weatherData = WeatherData();
//     weatherData.getWeatherData();
//
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: AssetImage('images/background.jpg'),
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
//                 onPressed: () {
//                   getLocation();
//                   getData();
//
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
//                 },
//                 child: const Text(
//                   'Location',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ),
//
//               Visibility(
//                 visible: isLoaded,
//                 replacement: const Center(child: CircularProgressIndicator(),),
//                 child: Center(
//                   child:  Text(' Latitude is: ${latitude.round()}  Longitude is: ${longitude.round()}',style: const TextStyle(fontSize: 18,
//                       fontWeight: FontWeight.bold),
//
//                   ),
//
//                 ),
//               ),
//
//
//             ],
//           ),
//
//
//
//         ),
//       ),
//     );
//   }
// }
