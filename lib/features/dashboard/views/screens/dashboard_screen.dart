library dashboard;

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_managment_ui/constants/constants.dart';
import 'package:project_managment_ui/shared_components/Shared_field.dart';
import 'package:project_managment_ui/shared_components/project_card.dart';
import 'package:project_managment_ui/shared_components/selection_button.dart';
import 'package:project_managment_ui/shared_components/today_text.dart';
import 'package:project_managment_ui/shared_components/upgrade_premium_card.dart';

//controller
part '../../controllers/dashboard_controller.dart';

//binding
part '../../bindings/dashboard_binding.dart';

//component
part '../components/header.dart';
part '../components/sidebar.dart';

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
            ],
          )),
      Flexible(
          flex: 4,
          child: Container(
            color: Colors.black,
          )),
    ]));
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kSpacing),
      child: _Header(),
    );
  }
}
