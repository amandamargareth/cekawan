import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OpenWeatherMap extends StatelessWidget {
  const OpenWeatherMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenWeatherMap'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(
              -2.548926, 118.014863), // Koordinat awal (0, 0 sebagai contoh)
          initialZoom: 2, // Zoom awal
        ),
        children: [
          TileLayer(
            urlTemplate:
                "https://tile.openweathermap.org/map/temp_new/{z}/{x}/{y}.png?appid=c25e0b8da7f3eadc5ecbcbb7dccc1066",
            // attributionBuilder: (_) {
            //   return const Text("© OpenWeatherMap");
            // },
          ),
          // TileLayer(
          //   urlTemplate:
          //       "https://tile.openweathermap.org/map/clouds_new/{z}/{x}/{y}.png?appid=c25e0b8da7f3eadc5ecbcbb7dccc1066",
          //   // attributionBuilder: (_) {
          //   //   return const Text("© OpenWeatherMap");
          //   // },
          // ),
          // TileLayer(
          //   urlTemplate:
          //       "https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=c25e0b8da7f3eadc5ecbcbb7dccc1066",
          //   // attributionBuilder: (_) {
          //   //   return const Text("© OpenWeatherMap");
          //   // },
          // ),
        ],
      ),
    );
  }
}
