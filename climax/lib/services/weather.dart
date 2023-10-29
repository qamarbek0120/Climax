import 'package:climax/services/location.dart';
import 'package:climax/services/networking.dart';
String IDkey = 'fd4bc2204d711c169a540251a6a2cb08';
const websiteURl = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {
  Future<dynamic> getCityWeather(String cityName)async{
    var urlUpdate = '$websiteURl?q=$cityName&appid=$IDkey&units=metric';
    NetworkHelper networkhelper = NetworkHelper(urlUpdate);
    var weatherData = await networkhelper.GetData();
    return weatherData;
  }
  Future<dynamic> getLoacationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper('$websiteURl?lat=${location.latitude}&lon=${location.longitude}&appid=$IDkey&units=metric');
    var weatherData = await networkHelper.GetData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}