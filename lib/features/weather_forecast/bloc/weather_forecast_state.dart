part of 'weather_forecast_bloc.dart';

enum Status { initial, loading, success, failure }

class WeatherForecastState extends Equatable {
  final Forecast? forecast;

  final Status status;

  const WeatherForecastState(this.forecast, this.status);

  const WeatherForecastState.initial()
      : forecast = null,
        status = Status.initial;

  const WeatherForecastState.loading()
      : forecast = null,
        status = Status.loading;

  const WeatherForecastState.success(this.forecast) : status = Status.success;

  const WeatherForecastState.failure()
      : forecast = null,
        status = Status.failure;

  @override
  List<Object?> get props => [forecast, status];
}
