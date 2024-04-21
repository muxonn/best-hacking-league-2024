import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:office_app/features/application/users/models/user.dart';

part 'user_cubit_state.dart';

class UserCubitCubit extends Cubit<UserCubitState> {
  UserCubitCubit() : super(UserCubitInitial());
}
