part of 'country_cubit.dart';

@immutable
abstract class CountryState {}

class CountryInitial extends CountryState {}
class CountryLoadingState extends CountryState {}

class CountrySuccessState extends CountryState {
  final GetCountryModel CountryResponse;

  CountrySuccessState(this.CountryResponse);

  @override
  List<Object> get props => [CountryResponse];
}

class CountryErrorState extends CountryState {
  final String error;

  CountryErrorState({required this.error});

  @override
  List<Object> get props => [error];
}