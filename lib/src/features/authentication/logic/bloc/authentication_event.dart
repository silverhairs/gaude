part of 'authentication_bloc.dart';

abstract class AuthenticationEvent with EquatableMixin {
  const AuthenticationEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AuthenticationLoginWithGoogle extends AuthenticationEvent {
  const AuthenticationLoginWithGoogle();
}

class AuthenticationLogout extends AuthenticationEvent {
  const AuthenticationLogout();
}
