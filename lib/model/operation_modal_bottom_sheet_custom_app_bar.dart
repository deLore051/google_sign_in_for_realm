import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '/model/realm_models.dart';

class OperationModalBottomSheetCustomAppBar extends StatefulWidget {
  const OperationModalBottomSheetCustomAppBar({
    super.key,
    required this.realm,
    required this.operationNameController,
    required this.operationItems,
  });

  final Realm realm;
  final RealmResults<Operation> operationItems;
  final TextEditingController operationNameController;

  @override
  State<OperationModalBottomSheetCustomAppBar> createState() =>
      _OperationModalBottomSheetCustomAppBarState();
}

class _OperationModalBottomSheetCustomAppBarState
    extends State<OperationModalBottomSheetCustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        color: Colors.grey.shade200,
      ),
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextButton(
                onPressed: () {
                  setState(() {
                    widget.operationNameController.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                )),
          ),
          Title(
              color: Colors.black,
              child: const Text(
                "Add operation",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.blue),
                )),
          ),
        ],
      ),
    );
  }
}
