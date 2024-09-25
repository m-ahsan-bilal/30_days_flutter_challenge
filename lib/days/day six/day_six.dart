import 'package:flutter/material.dart';
import 'package:flutter_challenge/days/day%20six/api_service.dart';
import 'package:go_router/go_router.dart';

class DaySix extends StatefulWidget {
  const DaySix({super.key});

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
            return const Center(child: CircularProgressIndicator());
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
            return const Center(child: Text('No data available'));
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
    if (cityWeather == null) return const SizedBox.shrink();

    String city = cityWeather['name'];
    String description = cityWeather['weather'][0]['description'];
    double temp = cityWeather['main']['temp'];
    double windSpeed = cityWeather['wind']['speed'];
    int humidity = cityWeather['main']['humidity'];

    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        title: Text(
          city,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              "Weather: $description",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Temperature: $temp°C",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Wind Speed: $windSpeed m/s",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Humidity: $humidity%",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
