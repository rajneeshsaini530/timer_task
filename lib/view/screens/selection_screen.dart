import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_eliteware/view/screens/login/login_screen.dart';
import 'package:task_eliteware/view/screens/timer/timer_screen.dart';
import 'package:task_eliteware/view/widgets/common_button_widget.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonButton(
              onPressed: () {
                Get.to(() => const TimerScreen());
              },
              title: 'Timer',
            ),
            const SizedBox(
              height: 20,
            ),
            CommonButton(
              onPressed: () {
                Get.to(() => const LoginScreen());
              },
              title: 'Login',
            ),
          ],
        ),
      ),
    );
  }
}
