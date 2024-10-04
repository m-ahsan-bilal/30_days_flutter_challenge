import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  WeatherCard({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.wb_sunny, color: Colors.orange),
              title: Text('${weatherData['name']}'),
              subtitle: Text(
                  'Temperature: ${weatherData['main']['temp']}°C\nWeather: ${weatherData['weather'][0]['description']}'),
            ),
          ],
        ),
      ),
    );
  }
}
