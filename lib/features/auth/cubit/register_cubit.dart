import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_state.dart';
import '../../../core/storage/local_storage.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> register(String username, String password) async {
    try {
      emit(RegisterLoading());
      await LocalStorage.saveUser(username, password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError("Registration failed"));
    }
  }
}
