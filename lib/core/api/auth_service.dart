import 'package:dio/dio.dart';

class AuthService {
  final Dio dio = Dio();

  Future<String> login(String username, String password) async {
    final res = await dio.post(
      'https://fakestoreapi.com/auth/login',
      data: {
        "username": username,
        "password": password,
      },
    );

    return res.data['token'];
  }
}
