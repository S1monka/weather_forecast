import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast/core/utils/geolocator_util.dart';
import 'package:weather_forecast/data/models/forecast.dart';
import 'package:weather_forecast/data/repositories/weather_forecast_repository.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

@singleton
class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final WeatherForecastRepository _weatherForecastRepository;

  WeatherForecastBloc(
    this._weatherForecastRepository,
  ) : super(const WeatherForecastState.initial()) {
    on<GetWeatherForecast>((event, emit) async {
      emit(const WeatherForecastState.loading());

      try {
        final position =
            event.position ?? await GeocodingUtil.getCurrentLocation();

        final data = await _weatherForecastRepository.getForecaset(
          position: position,
        );

        emit(WeatherForecastState.success(data));
      } catch (e) {
        emit(const WeatherForecastState.failure());
      }
    });

    add(const GetWeatherForecast());
  }
}
