part of 'create_address_cubit.dart';

@immutable
abstract class CreateAddressState {}

class CreateAddressInitial extends CreateAddressState {}

class CreateAddressLoadingState extends CreateAddressState {}

class CreateAddressSuccessState extends CreateAddressState {
  final CreateaddModel createaddressResponse;

  CreateAddressSuccessState(this.createaddressResponse);

  @override
  List<Object> get props => [createaddressResponse];
}

class CreateAddressErrorState extends CreateAddressState {
  final String error;

  CreateAddressErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
