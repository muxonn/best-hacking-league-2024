import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_app/features/application/current_user/current_user_repository.dart';
import 'package:office_app/features/application/current_user/models/current_user.dart';

part 'current_user_cubit_state.dart';

class CurrentUserCubit extends Cubit<CurrentUserCubitState> {
  CurrentUserCubit() : super(CurrentUserCubitInitial());

  void fetchCurrentUser(Map<String, String> headers) async {
    emit(CurrentUserCubitLoading());

    CurrentUserRepository repository = CurrentUserRepository();
    CurrentUser? user = await repository.getCurrentUser(headers);

    emit(CurrentUserCubitLoaded(user));
  }
}
