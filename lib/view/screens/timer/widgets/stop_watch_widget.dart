import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_eliteware/view/widgets/common_button_widget.dart';

import '../../../../view_model/timer_view_model.dart';

class StopWatchWidget extends StatelessWidget {
  const StopWatchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TimerViewModel>(
      builder: (viewModel) {
        final hours = viewModel
            .strDigits(viewModel.stopWatchDuration.value.inHours.remainder(24));
        final minutes = viewModel.strDigits(
            viewModel.stopWatchDuration.value.inMinutes.remainder(60));
        final seconds = viewModel.strDigits(
            viewModel.stopWatchDuration.value.inSeconds.remainder(60));
        // final milliSecond = viewModel.strDigits(
        //     viewModel.stopWatchDuration.value.inSeconds.remainder(100));
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
                  viewModel.startStopWatch();
                },
                title: 'Start',
              ),
              const SizedBox(height: 20),
              CommonButton(
                onPressed: () {
                  viewModel.stopStopWatchTimer();
                },
                title: 'Stop',
              ),
              const SizedBox(height: 20),
              CommonButton(
                onPressed: () {
                  viewModel.stopStopWatchTimer();
                  viewModel.resetStopWatch();
                },
                title: 'Reset',
              ),
            ],
          ),
        );
      },
    );
  }
}
