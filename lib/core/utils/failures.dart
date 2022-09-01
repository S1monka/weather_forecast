import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final int statusCode;

  const ServerFailure(this.statusCode) : super('Ошибка сервера : $statusCode');

  @override
  List<Object?> get props => [statusCode, message];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure() : super('Ошибка соединения');
}

class TokenInvalidFailure extends Failure {
  const TokenInvalidFailure() : super('Срок годности токена истёк');
}

class MustClearCart extends Failure {
  final Function() onAccept;
  const MustClearCart({required this.onAccept})
      : super('Необходимо подтвердить смену заведения');

  static const String infoMessage = 'Необходимо подтвердить смену заведения';
}

class DeliveryNotSupported extends Failure {
  const DeliveryNotSupported()
      : super(
            'Доставка не возможна, не найдено подходящего терминала доставки');

  static const String infoMessage =
      'Доставка не возможна, не найдено подходящего терминала доставки';
}

class WrongCredentialsFailure extends Failure {
  const WrongCredentialsFailure() : super('Введен неверный код');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('Неизвестная ошибка');
}
