import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// API Key dari OpenWeatherMap
const String apiKey = "c25e0b8da7f3eadc5ecbcbb7dccc106";
const String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

// Provider untuk nama kota
final cityProvider = StateProvider<String>((ref) => "Jakarta");

// Provider untuk cuaca terkini
final currentWeatherProvider =
    FutureProvider<Map<String, dynamic>>((ref) async {
  final city = ref.watch(cityProvider);
  final url = Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Gagal mendapatkan data cuaca');
  }
});

// Provider untuk notifikasi berdasarkan suhu
final notificationProvider = Provider<String>((ref) {
  final weatherData = ref.watch(currentWeatherProvider).maybeWhen(
        data: (data) => data,
        orElse: () => null,
      );

  if (weatherData != null) {
    final temp = (weatherData['main']['temp'] as num).toInt();
    if (temp <= 15) {
      return "Jangan lupa pake jaket ya, dingin! ❄️";
    } else if (temp <= 25) {
      return "Cuaca sejuk, tetap semangat! 🌤️";
    } else {
      return "Panas banget, jangan lupa minum air! ☀️";
    }
  }
  return "Tidak ada data cuaca.";
});
