import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast/core/utils/app_show_message.dart';
import 'package:weather_forecast/core/utils/failures.dart';
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
      emit(state.copyWith(status: Status.loading));

      try {
        final position =
            event.position ?? await GeocodingUtil.getCurrentLocation();

        final data = await _weatherForecastRepository.getForecaset(
          position: position,
        );

        emit(WeatherForecastState.success(data));
      } catch (e) {
        emit(state.copyWith(status: Status.failure));
        addError(e);
      }
    });

    add(const GetWeatherForecast());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    if (error is Failure) {
      showMessage(error.message, MessageType.error);
    }
  }
}
