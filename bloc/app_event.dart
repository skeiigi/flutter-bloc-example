part of 'app_bloc.dart';

abstract class RegisterEvent {}

class Registered extends RegisterEvent {
  final String login;
  final String password;
  Registered({required this.login, required this.password});
}

class Failed extends RegisterEvent {
  final String failString;
  Failed({required this.failString});
}