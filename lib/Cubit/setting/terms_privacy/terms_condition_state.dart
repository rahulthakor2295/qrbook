part of 'terms_condition_cubit.dart';

@immutable
abstract class TermsConditionState {}

class TermsConditionInitial extends TermsConditionState {}

class TermsConditionLoadingState extends TermsConditionState {}

class TermsConditionSuccessState extends TermsConditionState {
  final TermsConditionModel termsConditionResponse;

  TermsConditionSuccessState( this.termsConditionResponse);

  @override
  List<Object> get props => [termsConditionResponse];
}

class TermsConditionErrorState extends TermsConditionState {
  final String error;

  TermsConditionErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
