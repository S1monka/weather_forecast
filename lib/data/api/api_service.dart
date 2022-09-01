import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_forecast/data/models/forecast.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('forecast')
  Future<Forecast> getForecastData({
    @Query("latitude") required double latitude,
    @Query("longitude") required double longitude,
    @Query("hourly") List<String>? hourly = const [
      'temperature_2m',
      'weathercode',
    ],
    @Query("daily") List<String>? daily = const [
      'temperature_2m_max',
      'temperature_2m_min',
      'weathercode',
    ],
    @Query("current_weather") bool? currentWeather = true,
    @Query('timezone') String? timezone,
  });
}
