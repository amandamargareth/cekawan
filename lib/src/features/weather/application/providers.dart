import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_example_flutter/src/features/weather/data/weather_repository.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/forecast/forecast_data.dart';
import 'package:open_weather_example_flutter/src/features/weather/domain/weather/weather_data.dart';

final cityProvider = StateProvider<String>((ref) {
  return 'Bandung';
});

final currentWeatherProvider =
    FutureProvider.autoDispose<WeatherData>((ref) async {
  final city = ref.watch(cityProvider);
  final weather =
      await ref.watch(weatherRepositoryProvider).getWeather(city: city);
  return WeatherData.from(weather);
});

final hourlyWeatherProvider =
    FutureProvider.autoDispose<ForecastData>((ref) async {
  final city = ref.watch(cityProvider);
  final forecast =
      await ref.watch(weatherRepositoryProvider).getForecast(city: city);
  return ForecastData.from(forecast);
});

final notificationProvider = FutureProvider.autoDispose<String>((ref) async {
  final city = ref.watch(cityProvider);
  final weatherData = await ref.watch(currentWeatherProvider.future);

  // Mengakses suhu dari WeatherData
  final temp = weatherData.temp.celsius
      .toInt(); // Menggunakan .value untuk mendapatkan suhu dalam Celsius

  if (temp is num) {
    if (temp <= 15) {
      return "Jangan lupa pake jaket ya, dingin! ❄️ (Kota: $city)";
    } else if (temp <= 25) {
      return "Cuaca sejuk, tetap semangat! 🌤️ (Kota: $city)";
    } else {
      return "Panas banget, jangan lupa minum air! ☀️ (Kota: $city)";
    }
  } else {
    return "Data temperatur tidak valid. (Kota: $city)";
  }
});
