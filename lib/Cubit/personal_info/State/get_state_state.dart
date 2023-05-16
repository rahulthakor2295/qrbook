part of 'get_state_cubit.dart';

@immutable
abstract class GetStateState {}

class GetStateInitial extends GetStateState {}

class GetStateLoadingState extends GetStateState {}

class GetStateSuccessState extends GetStateState {
  final GetStateModel stateResponse;

  GetStateSuccessState( this.stateResponse);

  @override
  List<Object> get props => [stateResponse];
}

class GetStateErrorState extends GetStateState {
  final String error;

  GetStateErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
