import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_eliteware/utils/validator.dart';
import 'package:task_eliteware/view/widgets/common_button_widget.dart';
import 'package:task_eliteware/view/widgets/common_text_field.dart';
import 'package:task_eliteware/view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginViewModel loginViewModel = Get.put(LoginViewModel());
    return Scaffold(
      body: Form(
        key: loginViewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 56.0),
              CommonTextField(
                controller: loginViewModel.emailController,
                hint: 'Email',
                validator: (value) {
                  return Validator.validateEmail(value!);
                },
              ),
              const SizedBox(height: 16.0),
              CommonTextField(
                controller: loginViewModel.passwordController,
                hint: 'Password',
                isPassword: true,
                validator: (value) {
                  return Validator.validatePassword(value!);
                },
              ),
              const SizedBox(height: 40.0),
              CommonButton(
                onPressed: () {
                  ///Validate the form
                  if (loginViewModel.formKey.currentState!.validate()) {
                    // ProgressDialog.showProgressDialog();
                    loginViewModel.login().then((value) {
                      if (value) {
                        ///Login success navigate to next screen
                      } else {
                        ///Handel login failed show error message here
                      }
                    });
                  }
                },
                title: 'Login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
