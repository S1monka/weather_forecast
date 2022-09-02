part of 'weather_forecast_bloc.dart';

enum Status { initial, loading, success, failure }

class WeatherForecastState extends Equatable {
  final Forecast? forecast;

  final Status status;

  const WeatherForecastState(
    this.forecast,
    this.status,
  );

  const WeatherForecastState.initial()
      : forecast = null,
        status = Status.initial;

  const WeatherForecastState.success(this.forecast) : status = Status.success;

  @override
  List<Object?> get props => [forecast, status];

  WeatherForecastState copyWith({
    Forecast? forecast,
    Status? status,
  }) {
    return WeatherForecastState(
      forecast ?? this.forecast,
      status ?? this.status,
    );
  }
}
