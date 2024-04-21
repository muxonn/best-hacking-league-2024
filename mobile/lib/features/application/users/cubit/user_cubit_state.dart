part of 'user_cubit_cubit.dart';

abstract class UserCubitState {}

final class UserCubitInitial extends UserCubitState {}

final class UserCubitLoading extends UserCubitState {
  List<User>? users;

  UserCubitLoading(this.users);
}

final class UserCubitLoaded extends UserCubitState {
  List<User> users;

  UserCubitLoaded(this.users);
}
