// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api/api_provider.dart' as _i4;
import '../../data/repositories/repository_request_executor.dart' as _i5;
import '../../data/repositories/weather_forecast_repository.dart' as _i6;
import '../../features/weather_forecast/bloc/weather_forecast_bloc.dart' as _i7;
import 'modules/remote_module.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final remoteModule = _$RemoteModule();
  gh.factory<_i3.Dio>(() => remoteModule.dio);
  gh.factory<_i4.ApiServiceProvider>(
      () => _i4.ApiServiceProvider(get<_i3.Dio>()));
  gh.factory<_i5.RepositoryRequestExecutor>(
      () => _i5.RepositoryRequestExecutor(get<_i4.ApiServiceProvider>()));
  gh.factory<_i6.WeatherForecastRepository>(() =>
      _i6.WeatherForecastRepository(get<_i5.RepositoryRequestExecutor>()));
  gh.singleton<_i7.WeatherForecastBloc>(
      _i7.WeatherForecastBloc(get<_i6.WeatherForecastRepository>()));
  return get;
}

class _$RemoteModule extends _i8.RemoteModule {}
