part of 'about_cubit.dart';

@immutable
abstract class AboutState {}

class AboutInitial extends AboutState {}


class AboutLoadingState extends AboutState {}

class AboutSuccessState extends AboutState {
  final AboutModel aboutResponse;

  AboutSuccessState( this.aboutResponse);

  @override
  List<Object> get props => [aboutResponse];
}

class AboutErrorState extends AboutState {
  final String error;

  AboutErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
