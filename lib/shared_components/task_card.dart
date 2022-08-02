import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_managment_ui/constants/constants.dart';
import 'package:project_managment_ui/utils/helpers/helpers.dart';

class TaskCardData {
  final String title;
  final int dueDay;
  final List<ImageProvider> profileContributors;
  final TaskType type;
  final int totalComments;
  final int totalContributors;

  TaskCardData(
      {required this.title,
      required this.dueDay,
      required this.profileContributors,
      required this.type,
      required this.totalComments,
      required this.totalContributors});
}

class TaskCard extends StatelessWidget {
  const TaskCard(
      {Key? key,
      required this.data,
      required this.onPressedMore,
      required this.onPressedTask,
      required this.onPressedContributors,
      required this.onPressedComments})
      : super(key: key);

  final TaskCardData data;
  final Function() onPressedMore;
  final Function() onPressedTask;
  final Function() onPressedContributors;
  final Function() onPressedComments;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpacing),
      child: Column(
        children: [],
      ),
    );
  }
}
