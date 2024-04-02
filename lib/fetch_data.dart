import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/Weather.dart';

class WeatherService {
  static const String apiKey = 'de735372448245f853abca2548cf0d22';
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  static Future<Weather> fetchWeatherByLocationName(String locationName) async {
    final url = '$baseUrl?q=$locationName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data['name'];
      final temperature = data['main']['temp'];
      final humidity = data['main']['humidity'];
      final description = data['weather'][0]['description'];
      final iconCode = data['weather'][0]['icon']; // Retrieve icon code
      final iconUrl =
          'http://openweathermap.org/img/wn/$iconCode.png'; // Construct icon URL

      return Weather(
        location: location,
        temperature: temperature,
        humidity: humidity,
        description: description,
        iconUrl: iconUrl, // Pass icon URL to Weather object
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  static Future<Weather> fetchWeatherByCoordinates(
      double latitude, double longitude) async {
    final url =
        '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final location = data['name'];
      final temperature = data['main']['temp'];
      final humidity = data['main']['humidity'];
      final description = data['weather'][0]['description'];
      final iconCode = data['weather'][0]['icon']; // Retrieve icon code
      final iconUrl =
          'http://openweathermap.org/img/wn/$iconCode.png'; // Construct icon URL

      return Weather(
        location: location,
        temperature: temperature,
        humidity: humidity,
        description: description,
        iconUrl: iconUrl, // Pass icon URL to Weather object
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
