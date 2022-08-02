library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_managment_ui/constants/constants.dart';
import 'package:project_managment_ui/shared_components/Shared_field.dart';
import 'package:project_managment_ui/shared_components/progress_card.dart';
import 'package:project_managment_ui/shared_components/progress_report_card.dart';
import 'package:project_managment_ui/shared_components/project_card.dart';
import 'package:project_managment_ui/shared_components/selection_button.dart';
import 'package:project_managment_ui/shared_components/task_card.dart';
import 'package:project_managment_ui/shared_components/today_text.dart';
import 'package:project_managment_ui/shared_components/upgrade_premium_card.dart';
import 'package:project_managment_ui/utils/helpers/helpers.dart';

//controller
part '../../controllers/dashboard_controller.dart';

//binding
part '../../bindings/dashboard_binding.dart';

//component
part '../components/header.dart';
part '../components/sidebar.dart';
part '../components/overview_header.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Flexible(flex: 3, child: _Sidebar(data: controller.getSelectedProject())),
      Flexible(
          flex: 9,
          child: Column(
            children: [
              const SizedBox(height: kSpacing),
              _buildHeader(),
              const SizedBox(height: kSpacing),
              _buildProgress(),
              const SizedBox(height: kSpacing),
              _buildtaskOverview(data: controller.getAllTask()),
            ],
          )),
      Flexible(flex: 4, child: Container()),
    ]));
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacing),
      child: _Header(),
    );
  }

  Widget _buildProgress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: ProgressCard(
                data:
                    const ProgressCardData(totalUndone: 10, totalInProgess: 2),
                onPressCheck: () {}),
          ),
          const SizedBox(
            width: kSpacing / 2,
          ),
          Flexible(
              flex: 4,
              child: ProgressReportCard(
                data: ProgressReportCardData(
                  percent: .3,
                  title: "1st Sprint",
                  task: 3,
                  doneTask: 5,
                  undoneTask: 2,
                ),
              ))
        ],
      ),
    );
  }
}

Widget _buildtaskOverview({required List<TaskCardData> data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: Column(
      children: [
        _OverivewHeader(
          onSelected: (task) {},
        ),
        Row(
          children: data
              .map((e) => Expanded(
                      child: TaskCard(
                    data: e,
                    onPressedComments: () {},
                    onPressedContributors: () {},
                    onPressedMore: () {},
                    onPressedTask: () {},
                  )))
              .toList(),
        )
      ],
    ),
  );
}
