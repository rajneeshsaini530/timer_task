import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerViewModel extends GetxController {
  Timer? countdownTimer;
  Timer? stopWatchTimer;
  var timerDuration = const Duration(days: 5).obs;
  var stopWatchDuration = const Duration(days: 5).obs;

  String strDigits(int n) => n.toString().padLeft(2, '0');

  void startTimer(BuildContext context) async {
    stopTimer();
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    int minuts = (pickedTime!.hour * 60) + pickedTime.minute;
    print('Selected time -- ${pickedTime.minute}');
    timerDuration.value = Duration(minutes: minuts);
    update();
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void startStopWatch() async {
    stopStopWatchTimer();
    stopWatchTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => setIncreaseStopWatch());
  }

  void stopTimer() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
  }

  void stopStopWatchTimer() {
    if (stopWatchTimer != null) {
      stopWatchTimer!.cancel();
    }
  }

  void setCountDown() {
    final seconds = timerDuration.value.inSeconds - 1;
    if (seconds < 0) {
      countdownTimer!.cancel();
      showAlertDialog(Get.context!);
    } else {
      timerDuration.value = Duration(seconds: seconds);
      update();
    }
  }

  void setIncreaseStopWatch() {
    final seconds = stopWatchDuration.value.inSeconds + 1;
    if (seconds < 0) {
      stopWatchTimer!.cancel();
      showAlertDialog(Get.context!);
    } else {
      stopWatchDuration.value = Duration(seconds: seconds);
      update();
    }
  }

  resetStopWatch() {
    stopWatchDuration.value = const Duration(seconds: 0);
    update();
  }

  showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Time up'),
          content: const Text('Time is completed!'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
