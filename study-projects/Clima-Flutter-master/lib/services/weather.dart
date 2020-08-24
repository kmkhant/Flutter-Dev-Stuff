import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String openWeatherApiHook =
    'https://community-open-weather-map.p.rapidapi.com/weather';

class WeatherModel {
  Future<dynamic> getLocationData() async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherApiHook?lat=18.999803&lon=96.280698&callback=test&id=2172797&units=metric&mode=xml, html&q=Mandalay,mm');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather(String cityName) async {
    Location location = Location();
    await location.getCurrentPosition();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherApiHook?&callback=test&id=2172797&units=metric&mode=xml, html&q=$cityName,mm');
    var weatherData = await networkHelper.getData();
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
