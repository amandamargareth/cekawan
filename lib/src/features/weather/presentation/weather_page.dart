import 'package:cekawan/src/features/weather/presentation/weather_map.dart';
import 'package:flutter/material.dart';
import 'package:cekawan/src/constants/app_colors.dart';
import 'package:cekawan/src/features/weather/presentation/city_search_box.dart';
import 'package:cekawan/src/features/weather/presentation/current_weather.dart';
import 'package:cekawan/src/features/weather/presentation/hourly_weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key, required this.city});
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Memastikan latar belakang berada di belakang AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.network('cekawan.png'),
        actions: [
          IconButton(
            icon: const Icon(Icons.map, color: Colors.white),
            onPressed: () {
              // Navigasi atau aksi untuk membuka peta API OpenWeatherMap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OpenWeatherMap(),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              CitySearchBox(),
              Spacer(),
              CurrentWeather(),
              Spacer(),
              HourlyWeather(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
