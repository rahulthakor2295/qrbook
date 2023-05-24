part of 'update_address_cubit.dart';

@immutable
abstract class UpdateAddressState {}

class UpdateAddressInitial extends UpdateAddressState {}

class UpdateAddressLoadingState extends UpdateAddressState {
  @override
  List<Object> get props => [];
}

class UpdateAddressSuccessState extends UpdateAddressState {
  final UpdateAddressModel updateAddressResponse;

  UpdateAddressSuccessState(this.updateAddressResponse);

  @override
  List<Object> get props => [updateAddressResponse];
}

class UpdateAddressErrorState extends UpdateAddressState {
  final String error;

  UpdateAddressErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
