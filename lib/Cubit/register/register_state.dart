part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterModel RegisterResponse;

  RegisterSuccessState(this.RegisterResponse);

  @override
  List<Object> get props => [RegisterResponse];
}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
