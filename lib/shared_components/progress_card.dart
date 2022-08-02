import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_managment_ui/constants/constants.dart';

class ProgressCardData {
  final int totalUndone;
  final int totalInProgess;

  const ProgressCardData(
      {required this.totalUndone, required this.totalInProgess});
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({Key? key, required this.data, required this.onPressCheck})
      : super(key: key);

  final ProgressCardData data;
  final Function() onPressCheck;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadius),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Transform.translate(
                offset: const Offset(10, 30),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: SvgPicture.asset(
                    ImageVectorPath.happy2,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: kSpacing, left: kSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You have ${data.totalUndone} undone task",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "${data.totalInProgess} Tasks are in progress",
                  style: TextStyle(color: kFontColorPallets[1]),
                ),
                const SizedBox(
                  height: kSpacing,
                ),
                ElevatedButton(
                    onPressed: onPressCheck, child: const Text("Check"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
