import 'package:flutter/material.dart';
import 'package:weather/Weather.dart';

class WeatherUI extends StatelessWidget {
  final Weather weather;

  WeatherUI(this.weather);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.cyan[100],
        child: Container(
          constraints: BoxConstraints(
            minWidth: 300.0,
            minHeight: 200.0,
            maxWidth: 500.0,
            maxHeight: 300.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Image.network(
                  weather.iconUrl,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Location: ${weather.location}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Temperature: ${weather.temperature}°C',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Humidity: ${weather.humidity}%',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Description: ${weather.description}',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10), // Add some space between text and icon
              // Load weather icon from the URL
            ],
          ),
        ),
        borderOnForeground: true,
      ),
    );
  }
}
