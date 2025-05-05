part of 'app_bloc.dart';

abstract class RegisterState {}

class NoRegister extends RegisterState {}

class HasRegistered extends RegisterState {
  final String login;
  final String password;
  HasRegistered({required this.login, required this.password});
}

class RegisterFailed extends RegisterState {
  final String failString;
  RegisterFailed({required this.failString});
}