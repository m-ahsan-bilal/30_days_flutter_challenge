import 'dart:convert';
import 'package:flutter_challenge/utils/my_text_field.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_challenge/utils/weather_card.dart';
import 'package:go_router/go_router.dart';

class Day15 extends StatefulWidget {
  const Day15({super.key});

  @override
  State<Day15> createState() => _Day15State();
}

class _Day15State extends State<Day15> {
  final cityFocus = FocusNode();
  final String apiKey =
      '3b4d3c4b1781c3293a6989c2c6b9939a'; // Add your OpenWeatherMap API key
  // final String city = 'Lahore'; // Change this to any city you want

  bool isLoading = false;
  String errorMessage = '';
  Map<String, dynamic> weatherData = {};
  final cityController = TextEditingController();

  // Fetch data from OpenWeatherMap API
  Future<void> fetchWeather(String city) async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load weather data';
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred: $error';
      });
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // fetch weather on screen
  //   fetchWeather();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          'Day 15',
          style: TextStyle(
            color: Colors.lightGreen.shade500,
          ),
        ),
        centerTitle: true,
      ),

      // appBar: AppBar(
      //   title: Text('Weather in $city'),
      // ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyTextField(
            controller: cityController,
            hintText: "Enter City Name",
            obscureText: false,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a city name';
              }

              return null;
            },
            focusNode: cityFocus,
            onFieldSubmitted: (value) {
              fetchWeather(value);
            },
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                fetchWeather(cityController.text.trim());
              },
              child: Text('Search')),
          SizedBox(
            height: 16,
          ),
          if (isLoading)
            CircularProgressIndicator()
          else if (errorMessage.isNotEmpty)
            Text(errorMessage)
          else if (weatherData.isNotEmpty)
            WeatherCard(weatherData: weatherData)
        ],
      ),
      // body: isLoading
      //     ? Column(
      //         children: [
      //           Text(
      //             'Weather in $city',
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //           ),
      //           SizedBox(
      //             height: 30,
      //           ),
      //           Center(child: CircularProgressIndicator()),
      //         ],
      //       )
      //     : errorMessage.isNotEmpty
      //         ? Center(child: Text(errorMessage))
      //         : weatherData.isEmpty
      //             ? Center(child: Text('No data available'))
      //             : WeatherCard(weatherData: weatherData),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: fetchWeather,
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}
