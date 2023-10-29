import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:climax/utilities/constants.dart';
import 'package:climax/services/weather.dart';
import 'package:climax/screens/city_screen.dart';


class LOcationScreen extends StatefulWidget {
  LOcationScreen({this.locationWeather});
  final locationWeather;
  @override
  State<LOcationScreen> createState() => _LOcationScreenState();
}

class _LOcationScreenState extends State<LOcationScreen> {
  WeatherModel weather = new WeatherModel();
  int? temperature;
  String? weatherIcon;
  String? cityName;
  String? message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherIcon = 'Error';
        message = 'Error has been occured. Please, try again';
        cityName = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature!);
    });

    print(temperature);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          TextButton(
                              onPressed: () async {
                                var weatherData = await weather.getLoacationWeather();
                                updateUI(weatherData);
                              },
                              child: Icon(
                                Icons.near_me,
                                size: 50.0,
                                color: Colors.blueGrey,
                              )
                          ),
                          TextButton(
                            onPressed: () async {
                              var typeName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                                return CityScreen();
                              }));
                              if(typeName != null){
                                var weatherData = await weather.getCityWeather(typeName);
                                updateUI(weatherData);
                                print(typeName);
                              }
                            },
                            child: Icon(
                              Icons.maps_home_work_outlined,
                              size: 50.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, left: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '$temperature°',
                            style: kTempTextStyle,
                          ),
                          Text(
                            '$weatherIcon',
                            style: kConditionTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    color: Colors.black12,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0)
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          '$message in $cityName!',
                            style: kMessageTextStyle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
