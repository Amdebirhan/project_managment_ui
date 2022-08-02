import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_managment_ui/constants/constants.dart';

class ProgressReportCardData {
  final double percent;
  final String title;
  final int task;
  final int doneTask;
  final int undoneTask;

  ProgressReportCardData(
      {required this.percent,
      required this.title,
      required this.task,
      required this.doneTask,
      required this.undoneTask});
}

class ProgressReportCard extends StatelessWidget {
  const ProgressReportCard({Key? key, required this.data}) : super(key: key);

  final ProgressReportCardData data;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpacing),
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(111, 88, 255, 1),
            Color.fromRGBO(157, 86, 246, 1)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(data.title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 15,
              ),
              _RichText(value1: "${data.task}", value2: " Task"),
              const SizedBox(
                height: 15,
              ),
              _RichText(value1: "${data.doneTask}", value2: " Done Task"),
              const SizedBox(
                height: 15,
              ),
              _RichText(value1: "${data.undoneTask}", value2: " Undone Task"),
            ],
          ),
          const Spacer(),
          _Indicator(percent: data.percent)
        ],
      ),
    );
  }
}

class _RichText extends StatelessWidget {
  const _RichText({Key? key, required this.value1, required this.value2})
      : super(key: key);

  final String value1;
  final String value2;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: kFontColorPallets[0]),
            children: [
          TextSpan(text: value1),
          TextSpan(
              text: value2,
              style: const TextStyle(fontWeight: FontWeight.w100)),
        ]));
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({required this.percent, Key? key}) : super(key: key);

  final double percent;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80,
      lineWidth: 15,
      percent: percent,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (percent * 100).toString() + " %",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            "Completed",
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
          ),
        ],
      ),
      progressColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(.3),
    );
  }
}
