part of 'get_city_cubit.dart';

@immutable
abstract class GetCityState {}

class GetCityInitial extends GetCityState {}

class GetCityLoadingState extends GetCityState {}

class GetCitySuccessState extends GetCityState {
  final GetCityModel cityResponse;

 GetCitySuccessState( this.cityResponse);

  @override
  List<Object> get props => [cityResponse];
}

class GetCityErrorState extends GetCityState {
  final String error;

 GetCityErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
