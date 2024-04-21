part of 'current_user_cubit.dart';

abstract class CurrentUserCubitState {}

final class CurrentUserCubitInitial extends CurrentUserCubitState {}

final class CurrentUserCubitLoading extends CurrentUserCubitState {
  CurrentUser? user;
  CurrentUserCubitLoading({this.user});
}

final class CurrentUserCubitLoaded extends CurrentUserCubitState {
  CurrentUser? user;

  CurrentUserCubitLoaded(this.user);
}
