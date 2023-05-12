part of 'verify_number_cubit.dart';

@immutable
abstract class VerifyNumberState {}

class VerifyNumberInitial extends VerifyNumberState {}

class VerifyNumberLoadingState extends VerifyNumberState {}

class VerifyNumberSuccessState extends VerifyNumberState {
  final VerifyNumberModel verifyNumberResponse;

  VerifyNumberSuccessState(this.verifyNumberResponse);

  @override
  List<Object> get props => [verifyNumberResponse];
}

class VerifyNumberErrorState extends VerifyNumberState {
  final String error;

  VerifyNumberErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
