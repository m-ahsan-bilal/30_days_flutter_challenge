import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '74febbe6950ab2ca70d0e16e4ad6b742';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // Function to fetch weather data for a city
  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // List of cities to fetch data for
  List<String> cities = ['New York', 'London', 'Tokyo', 'Paris', 'Karachi'];
}
