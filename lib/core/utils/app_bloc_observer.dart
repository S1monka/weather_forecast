import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_show_message.dart';
import 'failures.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (error is Failure) {
      showMessage(error.message, MessageType.error);
    }
  }
}
