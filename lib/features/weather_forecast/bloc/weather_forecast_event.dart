part of 'weather_forecast_bloc.dart';

abstract class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherForecast extends WeatherForecastEvent {
  final Position? position;

  const GetWeatherForecast({this.position});
}
