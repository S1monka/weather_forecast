import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_forecast/core/utils/failures.dart';

import '../api/api_provider.dart';
import '../api/api_service.dart';

@injectable
class RepositoryRequestExecutor {
  final ApiServiceProvider _apiServiceProvider;

  RepositoryRequestExecutor(this._apiServiceProvider);

  Future<T> execute<T>(
    Future<T> Function(ApiService apiService) getFromRemote,
  ) async {
    const debug = false;
    try {
      final dataFromRemote = await getFromRemote(
        _apiServiceProvider.getApiService(),
      );
      // ignore: avoid_print
      if (debug) print('Obtained $T successfully from remote source');
      return dataFromRemote;
    } on DioError catch (e) {
      if (e.error is SocketException ||
          e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw const ConnectionFailure();
      }
      if (e.response != null) {
        throw ServerFailure(e.response!.statusCode as int);
      }
      throw const UnknownFailure();
    }
  }
}
