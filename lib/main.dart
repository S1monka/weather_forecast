import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'core/utils/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection();

  Bloc.observer = AppBlocObserver();
  runApp(const WeatherForecastApp());
}