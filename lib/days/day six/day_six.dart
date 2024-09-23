import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20six/api_service.dart';
import 'package:go_router/go_router.dart';

class DaySix extends StatefulWidget {
  @override
  _DaySixState createState() => _DaySixState();
}

class _DaySixState extends State<DaySix> {
  final WeatherService weatherService = WeatherService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.go('/');
              },
              icon: const Icon(Icons.arrow_back))
        ],
        title: Text(
          'Day 6',
          style: TextStyle(
            color: Colors.lightGreen.shade500,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchWeatherForCities(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var cityWeather = snapshot.data?[index];
                return weatherCard(cityWeather);
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  // Fetch weather data for all cities
  Future<List<Map<String, dynamic>>> fetchWeatherForCities() async {
    List<Map<String, dynamic>> weatherData = [];
    for (String city in weatherService.cities) {
      var weather = await weatherService.fetchWeather(city);
      weatherData.add(weather);
    }
    return weatherData;
  }

  // Card widget to display weather information
  Widget weatherCard(Map<String, dynamic>? cityWeather) {
    if (cityWeather == null) return SizedBox.shrink();

    String city = cityWeather['name'];
    String description = cityWeather['weather'][0]['description'];
    double temp = cityWeather['main']['temp'];
    double windSpeed = cityWeather['wind']['speed'];
    int humidity = cityWeather['main']['humidity'];

    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          city,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              "Weather: $description",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Temperature: $temp°C",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Wind Speed: $windSpeed m/s",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Humidity: $humidity%",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
