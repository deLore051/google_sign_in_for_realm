import 'package:flutter/material.dart';
import '/model/realm_models.dart';
import 'package:auto_size_text/auto_size_text.dart';

class EmployeeListViewTile extends StatelessWidget {
  EmployeeListViewTile({super.key, required this.workerItem});

  final Worker workerItem;

  //final listViewTileLabelTextStyle = const TextStyle(
  //fontSize: 10, color: Colors.grey, fontStyle: FontStyle.normal);

  //final listViewTileLeftColumnTextStyle = const TextStyle(fontSize: 16);

  //final listViewTileRightColumnTextStyle = const TextStyle(fontSize: 14);
  final TextStyle textStyle = const TextStyle(fontSize: 14);

  final labelTextAutoSizeGroup = AutoSizeGroup();
  final variableTextAutoSizeGroup = AutoSizeGroup();

  AutoSizeText getAutoSizedLabel(String text) {
    return AutoSizeText(
      text,
      presetFontSizes: const [14, 12, 10, 8],
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Colors.grey, fontStyle: FontStyle.normal),
      group: labelTextAutoSizeGroup,
    );
  }

  AutoSizeText getAutoSizedVariableText(String text) {
    return AutoSizeText(
      text,
      presetFontSizes: const [18, 16, 14, 12],
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.normal,
          overflow: TextOverflow.ellipsis),
      //group: variableTextAutoSizeGroup,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber.shade100,
      constraints: const BoxConstraints(
        minWidth: 320,
        minHeight: 90,
        maxHeight: 120,
      ),
      // height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: getAutoSizedLabel("NAME"),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8.0),
                child: getAutoSizedVariableText(
                    "${workerItem.firstName} ${workerItem.lastName}"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: getAutoSizedLabel("CURRENT OPERATION"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: getAutoSizedVariableText("/"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: getAutoSizedLabel("TODAY'S TIME"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: getAutoSizedVariableText("00:00:00"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: getAutoSizedLabel("TODAY'S EARNINGS"),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: getAutoSizedVariableText("13043.59"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: getAutoSizedLabel("RSD"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
