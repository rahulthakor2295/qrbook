part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {
  final EditProfileModel editProfileResponse;

  EditProfileSuccessState(this.editProfileResponse);

  @override
  List<Object> get props => [editProfileResponse];
}

class EditProfileErrorState extends EditProfileState {
  final String error;

  EditProfileErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
