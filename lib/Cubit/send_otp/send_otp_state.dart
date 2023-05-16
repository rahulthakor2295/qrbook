part of 'send_otp_cubit.dart';

@immutable
abstract class SendOtpState {}

class SendOtpInitial extends SendOtpState {}
class SendOtpLoadingState extends SendOtpState {}

class SendOtpSuccessState extends SendOtpState {
  final SendOtpModel sendOtpResponse;

  SendOtpSuccessState(this.sendOtpResponse);

  @override
  List<Object> get props => [sendOtpResponse];
}

class SendOtpErrorState extends SendOtpState {
  final String error;

  SendOtpErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
