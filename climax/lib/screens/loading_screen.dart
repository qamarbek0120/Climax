import 'package:climax/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climax/services/weather.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }
  void getLocationData() async {
    var weatherData = await WeatherModel().getLoacationWeather();
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return LOcationScreen(locationWeather: weatherData);
    }));
  }
  void getRequest() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
  }
  @override
  Widget build(BuildContext context) {
    // String myMargin = 'gjhg';
    // double myMarginAsDouble;
    // try{
    //    myMarginAsDouble = double.parse(myMargin);
    // }
    // catch(e){
    //   print(e);
    // }
    // return Scaffold(
    //   body: Container(
    //     color: Colors.red,
    //     margin: EdgeInsets.all(20),
    //   ),
    // );
    return Scaffold(
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.grey.shade400,
          size: 60.0,
        )
      ),
    );
  }
}
