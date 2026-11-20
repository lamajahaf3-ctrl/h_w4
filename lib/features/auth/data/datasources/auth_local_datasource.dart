import '../../../../core/services/storage_service.dart';
import '../../domain/entities/user_entity.dart';

class AuthLocalDataSource {
  final StorageService _storage;
  AuthLocalDataSource(this._storage);

  Future<UserEntity> login({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 350));
    final cleanName = name.trim().isEmpty ? 'ظ…ط³طھط®ط¯ظ… ط¥ظٹط¬ط§ط±ظٹ' : name.trim();
    await _storage.setLoggedIn(true);
    await _storage.setUserName(cleanName);
    return UserEntity(name: cleanName, email: email.trim());
  }

  Future<void> logout() => _storage.setLoggedIn(false);
  bool isAuthenticated() => _storage.isLoggedIn;
}
