import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/Weather.dart';
import 'package:weather/fetch_data.dart';
import 'package:weather/namedLocation.dart';
import 'package:weather/weatherUI.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Weather? _weather;
  bool _showError = false;

  @override
  void initState() {
    super.initState();
    _getLocationAndWeather();
  }

  Future<void> _getLocationAndWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Weather weather = await WeatherService.fetchWeatherByCoordinates(
          position.latitude, position.longitude);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Failed to get location: $e');
      setState(() {
        _showError = true;
      });
    }
  }

  Future<void> _getWeatherForLocation(String location) async {
    try {
      Weather weather =
          await WeatherService.fetchWeatherByLocationName(location);
      setState(() {
        _weather = weather;
        _showError = false;
      });
    } catch (e) {
      print('Failed to get weather for location: $e');
      setState(() {
        _showError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: _showError
            ? SizedBox(
                width: 300.0,
                height: 300.0,
                child: Text(
                  'Can\'t found the named location. please enter corrrect named location',
                  style: TextStyle(color: Colors.red),
                ),
              )
            : _weather != null
                ? WeatherUI(_weather!)
                : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? location = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LocationInput()),
          );
          if (location != null) {
            await _getWeatherForLocation(location);
          }
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
