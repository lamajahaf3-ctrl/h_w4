import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<({UserEntity? user, Failure? failure})> login({
    required String name,
    required String email,
    required String password,
  });
  Future<void> logout();
  bool isAuthenticated();
}
