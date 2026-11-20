import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login_title'.tr)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('login_subtitle'.tr),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'name_label'.tr, border: const OutlineInputBorder()),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'ظ…ط·ظ„ظˆط¨' : null,
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: 'email_label'.tr, border: const OutlineInputBorder()),
                validator: (v) => (v == null || !v.contains('@')) ? 'ط¨ط±ظٹط¯ ط؛ظٹط± طµط§ظ„ط­' : null,
              ),
              const SizedBox(height: 14),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.isObscure.value,
                  decoration: InputDecoration(
                    labelText: 'password_label'.tr,
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(controller.isObscure.value ? Icons.visibility : Icons.visibility_off),
                      onPressed: controller.toggleObscure,
                    ),
                  ),
                  validator: (v) => (v == null || v.length < 4) ? '4 ط£ط­ط±ظپ ط¹ظ„ظ‰ ط§ظ„ط£ظ‚ظ„' : null,
                ),
              ),
              const SizedBox(height: 24),
              Obx(
                () => FilledButton(
                  onPressed: controller.isLoading.value ? null : controller.submitLogin,
                  child: Text('login_btn'.tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
