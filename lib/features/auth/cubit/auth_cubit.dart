import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommer_app_market/features/auth/cubit/auth_state.dart';

import '../data/model/auth_model.dart';
import '../data/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepo;

  AuthCubit({required this.authRepo}) : super(AuthState());

  void register(AuthModel user) async {
    emit(state.copyWith(buttonStatus: AuthStatus.loading));

    final res = await authRepo.register(user);

    if (res == null) {
      emit(state.copyWith(buttonStatus: AuthStatus.error));
    } else {
      emit(state.copyWith(buttonStatus: AuthStatus.success));
    }
  }
}
