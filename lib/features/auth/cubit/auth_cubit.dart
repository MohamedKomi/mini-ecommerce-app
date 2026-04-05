import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';
import '../../../core/storage/local_storage.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String username, String password) async {
    try {
      emit(AuthLoading());

      bool exists = await LocalStorage.checkUser(username, password);

      if (!exists) {
        emit(AuthError("User not found, please register"));
        return;
      }

      await LocalStorage.saveToken(username);
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError("Login failed"));
    }
  }
}
