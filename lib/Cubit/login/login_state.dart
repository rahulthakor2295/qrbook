part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginResponse;

  LoginSuccessState(this.loginResponse);

  @override
  List<Object> get props => [loginResponse];
}

class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
