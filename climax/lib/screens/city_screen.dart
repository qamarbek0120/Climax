import 'dart:ui';
import 'package:climax/screens/loading_screen.dart';
import 'package:climax/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:climax/utilities/constants.dart';
class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoadingScreen();
                      }));
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    decoration: kTextFieldInputDeco,
                    onChanged: (value){
                      setState(() {
                        cityName = value;
                      });
                    }
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: TextButton(
                      onPressed: (){
                        Navigator.pop(context, cityName);
                      },
                      child: Text('Get Weather',
                      style: kButtonTextStyle,),
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
