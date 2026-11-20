import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource _dataSource;
  AuthRepositoryImpl(this._dataSource);

  @override
  Future<({UserEntity? user, Failure? failure})> login({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _dataSource.login(name: name, email: email, password: password);
      return (user: user, failure: null);
    } catch (e) {
      return (user: null, failure: Failure(e.toString()));
    }
  }

  @override
  Future<void> logout() => _dataSource.logout();

  @override
  bool isAuthenticated() => _dataSource.isAuthenticated();
}
