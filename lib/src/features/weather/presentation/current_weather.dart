import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cekawan/src/features/weather/application/providers.dart';
import 'package:cekawan/src/features/weather/domain/weather/weather_data.dart';
import 'package:cekawan/src/features/weather/presentation/weather_icon_image.dart';

class CurrentWeather extends ConsumerWidget {
  const CurrentWeather({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataValue = ref.watch(currentWeatherProvider); // Data cuaca
    final city = ref.watch(cityProvider); // Nama kota

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Menampilkan nama kota
        Text(city, style: Theme.of(context).textTheme.headlineMedium),
        // Menampilkan data cuaca
        weatherDataValue.when(
          data: (weatherData) => Column(
            children: [
              CurrentWeatherContents(data: weatherData), // Komponen cuaca
              const SizedBox(height: 16),
              // Menampilkan notifikasi dengan pengelolaan status AsyncValue
              ref.watch(notificationProvider).when(
                    data: (notificationMessage) => Text(
                      notificationMessage,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, __) => Text(
                      'Gagal memuat notifikasi: $e',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
            ],
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, __) => Text(e.toString()),
        ),
      ],
    );
  }
}

class CurrentWeatherContents extends ConsumerWidget {
  const CurrentWeatherContents({super.key, required this.data});
  final WeatherData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    // Mengakses suhu dalam Celsius dan mengubahnya menjadi integer untuk ditampilkan
    final temp = data.temp.celsius.toInt().toString();
    final minTemp = data.minTemp.celsius.toInt().toString();
    final maxTemp = data.maxTemp.celsius.toInt().toString();
    final highAndLow = 'H:$maxTemp° L:$minTemp°';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Menampilkan ikon cuaca
        WeatherIconImage(iconUrl: data.iconUrl, size: 120),
        // Menampilkan suhu saat ini
        Text(temp, style: textTheme.displayMedium),
        // Menampilkan suhu tertinggi dan terendah
        Text(highAndLow, style: textTheme.bodyMedium),
      ],
    );
  }
}
