import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RemoteModule {
  Dio get dio => Dio();
}
