import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_eliteware/view/screens/timer/widgets/stop_watch_widget.dart';
import 'package:task_eliteware/view/screens/timer/widgets/timer_widget.dart';
import 'package:task_eliteware/view_model/timer_view_model.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimerViewModel timerViewModel = Get.put(TimerViewModel());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Timer'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.watch_later), text: "Timer"),
              Tab(icon: Icon(Icons.timer), text: "Stop Watch")
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TimerWidget(),
            StopWatchWidget(),
          ],
        ),
      ),
    );
  }
}
