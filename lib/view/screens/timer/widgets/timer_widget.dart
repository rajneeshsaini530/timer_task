import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:task_eliteware/view/widgets/common_button_widget.dart';
import 'package:task_eliteware/view_model/timer_view_model.dart';
class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerViewModel>(
      builder: (viewModel) {
        final hours = viewModel
            .strDigits(viewModel.timerDuration.value.inHours.remainder(24));
        final minutes = viewModel
            .strDigits(viewModel.timerDuration.value.inMinutes.remainder(60));
        final seconds = viewModel
            .strDigits(viewModel.timerDuration.value.inSeconds.remainder(60));
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(.4)),
                child: Text(
                  '$hours:$minutes:$seconds',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 50),
                ),
              ),
              const SizedBox(height: 50),
              CommonButton(
                onPressed: () {
                  viewModel.startTimer(context);
                },
                title: 'Set Timer',
              ),
              const SizedBox(height: 20),
              CommonButton(
                onPressed: () {
                  if (viewModel.countdownTimer == null ||
                      viewModel.countdownTimer!.isActive) {
                    viewModel.stopTimer();
                  }
                },
                title: 'Stop',
              ),
            ],
          ),
        );
      },
    );
  }
}
