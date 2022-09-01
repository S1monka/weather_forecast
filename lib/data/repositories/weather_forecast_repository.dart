import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:geolocator/geolocator.dart';

import 'package:injectable/injectable.dart';
import 'package:weather_forecast/data/models/forecast.dart';
import 'package:weather_forecast/data/repositories/repository_request_executor.dart';

@injectable
class WeatherForecastRepository {
  final RepositoryRequestExecutor _requestExecutor;

  WeatherForecastRepository(this._requestExecutor);

  Future<Forecast> getForecaset({
    required Position position,
  }) async {
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();

    return await _requestExecutor.execute(
      (apiService) => apiService.getForecastData(
        latitude: position.latitude,
        longitude: position.longitude,
        timezone: currentTimeZone,
      ),
    );
  }
}
