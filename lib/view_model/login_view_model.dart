import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_eliteware/utils/interceptor/authorization_interceptor.dart';

class LoginViewModel extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Dio _dio = Dio();

  @override
  void onInit() {
    ///add the base url here
    _dio.options.baseUrl = 'https://BASE_URL';
    _dio.interceptors..add(AuthorizationInterceptor());
    super.onInit();
  }

  ///login API call method
    Future<bool> login() async {
    try {
      // call the POST api call
      var response = await _dio.post(
        '/login',
        data: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim()
        },
      );

      // Handle success response
      if (response.statusCode == 200) {
        // Login successful, Store the data in the session
        return true;
      } else {
        // Handle other status codes if needed
        print('Unexpected status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle error cases
      return false;
      print('Error occurred: $e');
    }
  }
}
