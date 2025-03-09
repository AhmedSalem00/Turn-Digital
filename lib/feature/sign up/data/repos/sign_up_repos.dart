import 'package:dio/dio.dart';

class SignUpRepository {
  final Dio _dio = Dio();

  Future<Response> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    const String apiUrl =
        "http://api.td-dev.turndigital.net/api/users/register";

    try {
      final response = await _dio.post(
        apiUrl,
        data: {
          "name": fullName,
          "email": email.trim(),
          "password": password.trim(),
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
