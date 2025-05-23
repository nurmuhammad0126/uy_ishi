import 'package:ecommer_app_market/features/auth/data/model/auth_model.dart';
import 'package:ecommer_app_market/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepo;
  AuthBloc({required this.authRepo}) : super(AuthState()) {
    on<AuthRegisterEvent>((event, emit) async {
      emit(state.copyWith(buttonStatus: AuthStatus.loading));

      final res = await authRepo.register(event.user);

      if (res == null) {
        emit(state.copyWith(buttonStatus: AuthStatus.error));
      } else {
        emit(state.copyWith(buttonStatus: AuthStatus.success));
      }
    });
  }
}
