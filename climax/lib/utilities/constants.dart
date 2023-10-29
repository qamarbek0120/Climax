import 'package:flutter/material.dart';
import 'package:climax/screens/city_screen.dart';

const kTempTextStyle = TextStyle(
  fontSize: 110.0,
  color: Colors.black
);

const kMessageTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey
);

const kButtonTextStyle = TextStyle(
  fontSize: 35.0,
  color: Colors.white,
  fontWeight: FontWeight.bold
);

const kConditionTextStyle = TextStyle(
  fontSize: 120.0,
);

const kTextFieldInputDeco = InputDecoration(
  filled: true,
  fillColor: Colors.black12,
  hintText: 'Search City',
  hintStyle: TextStyle(
      color: Colors.white,
      fontSize: 20
  ),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      borderSide: BorderSide.none
  ),
);