
import 'package:dio/dio.dart';
import 'package:ecommer_app_market/features/auth/data/model/auth_model.dart';

class AuthRemoteDatasource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  Future<AuthModel> registerUser(AuthModel user) async {
    try {
      final response = await _dio.post(
        'https://fakestoreapi.com/users',
        data: user.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AuthModel.fromJson(response.data);
      } else {
        throw Exception('Register failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Register failed: $e');
    }
  }
}
