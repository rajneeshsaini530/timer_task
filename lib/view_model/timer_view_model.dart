import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerViewModel extends GetxController {
  Timer? countdownTimer;
  Timer? stopWatchTimer;
  var timerDuration = const Duration(days: 5).obs;
  var stopWatchDuration = const Duration(days: 5).obs;

  String strDigits(int n) => n.toString().padLeft(2, '0');

  ///Start the timer for Timer
  ///[context] build context for the timer picker
  void startTimer(BuildContext context) async {
    stopTimer();
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    int minutes = (pickedTime!.hour * 60) + pickedTime.minute;
    timerDuration.value = Duration(minutes: minutes);
    update();

    ///Start the count down timer
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  ///Start the stop watch timer
  void startStopWatch() async {
    stopStopWatchTimer();
    stopWatchTimer = Timer.periodic(
        const Duration(seconds: 1), (_) => setIncreaseStopWatch());
  }

  ///Stop the count down timer for Timer
  void stopTimer() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
  }

  ///Stop the timer for stop watch
  void stopStopWatchTimer() {
    if (stopWatchTimer != null) {
      stopWatchTimer!.cancel();
    }
  }

  ///Set the count down for Timer
  void setCountDown() {
    final seconds = timerDuration.value.inSeconds - 1;
    if (seconds < 0) {
      countdownTimer!.cancel();

      ///Show the alert dialog on time completion
      showAlertDialog(Get.context!);
    } else {
      timerDuration.value = Duration(seconds: seconds);
      update();
    }
  }

  ///Set the stop watch increment timer
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

  ///Reset the stop watch
  resetStopWatch() {
    stopWatchDuration.value = const Duration(seconds: 0);
    update();
  }

  ///Show the alert dialog
  ///[context] build context to show the dialog
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
