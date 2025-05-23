import 'package:ecommer_app_market/features/auth/data/datasourece/local_datasource.dart';
import 'package:ecommer_app_market/features/auth/data/datasourece/remote_datasource.dart';
import 'package:ecommer_app_market/features/auth/data/model/auth_model.dart';

class AuthRepository {
  final AuthRemoteDatasource _authRemote;
  final AuthLocalDatasource _localDatasource;

  AuthRepository({
    required AuthRemoteDatasource authRemote,
    required AuthLocalDatasource localDatasource,
  }) : _authRemote = authRemote,
       _localDatasource = localDatasource;

  Future<AuthModel?> register(AuthModel user) async {
    try {
      final res = await _authRemote.registerUser(user);

      await _localDatasource.saveUser(res);
    } catch (e) {
      print("Register failed: $e");
    }
    return null;
  }
}
