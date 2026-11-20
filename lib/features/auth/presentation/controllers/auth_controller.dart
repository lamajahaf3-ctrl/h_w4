import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/routes/app_routes.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _repository;
  AuthController(this._repository);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final RxBool isObscure = true.obs;

  void toggleObscure() => isObscure.value = !isObscure.value;

  Future<void> submitLogin() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    isLoading.value = true;
    final res = await _repository.login(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    isLoading.value = false;
    if (res.failure != null) {
      Get.snackbar('طھظ†ط¨ظٹظ‡', res.failure!.message);
      return;
    }
    Get.offAllNamed(AppRoutes.main);
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
