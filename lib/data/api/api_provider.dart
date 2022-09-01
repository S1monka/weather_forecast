import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_service.dart';

@injectable
class ApiServiceProvider {
  final Dio _dio;

  static const baseUrl = 'https://api.open-meteo.com/v1/';

  ApiServiceProvider(this._dio);

  ApiService getApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final headers = <String, dynamic>{};

          headers.putIfAbsent(
            HttpHeaders.acceptHeader,
            () => 'application/json',
          );
          options.headers.addAll(headers);
          options.connectTimeout = 20000;
          options.receiveTimeout = 20000;
          handler.next(options);
        },
      ),
    );

    return ApiService(
      _dio,
      baseUrl: baseUrl,
    );
  }
}
