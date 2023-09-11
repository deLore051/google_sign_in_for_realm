import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '/model/custom_text_form_field.dart';
import '/model/operation_modal_bottom_sheet_custom_app_bar.dart';
import '/model/realm_models.dart';

class OperationModalBottomSheet extends StatefulWidget {
  const OperationModalBottomSheet({
    super.key,
    required this.realm,
    required this.heightToUse,
    required this.operationItems,
  });

  final Realm realm;
  final double heightToUse;
  final RealmResults<Operation> operationItems;

  @override
  State<OperationModalBottomSheet> createState() =>
      _OperationModalBottomSheetState();
}

List<String> operationTypeDropdownData = ["By hour", "By quantity"];
List<String> unitTypeDropdownData = [
  "pcs.",
  "kg",
  "m",
  "l",
  "bottle",
  "box",
  "pack"
];

class _OperationModalBottomSheetState extends State<OperationModalBottomSheet> {
  late TextEditingController operationNameController;
  late FocusNode operationNameFocusNode;

  @override
  void initState() {
    super.initState();
    operationNameController = TextEditingController();
    operationNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    operationNameController.dispose();
    operationNameFocusNode.dispose();
    super.dispose();
  }

  List<bool> operationTypeIsSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    final operationNameFieldKey = GlobalKey<FormFieldState>();

    return SizedBox(
      height: widget.heightToUse,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          OperationModalBottomSheetCustomAppBar(
              realm: widget.realm,
              operationNameController: operationNameController,
              operationItems: widget.operationItems),
          SizedBox(
            height: widget.heightToUse - 40,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CustomTextFormField(
                        controller: operationNameController,
                        labelText: "Operation name",
                        validatorErrorText:
                            "Operation name is required to proceed!",
                        formFieldKey: operationNameFieldKey,
                        focusNode: operationNameFocusNode),
                  ),
                  Container(
                    constraints: const BoxConstraints(minWidth: 320),
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Text(
                            "TYPE",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: ToggleButtons(
                            selectedColor: Colors.white,
                            color: Colors.grey.shade400,
                            fillColor: Colors.blue,
                            renderBorder: true,
                            borderColor: Colors.grey.shade500,
                            borderWidth: 1.5,
                            borderRadius: BorderRadius.circular(10),
                            selectedBorderColor: Colors.grey.shade800,
                            textStyle: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                            isSelected: operationTypeIsSelected,
                            onPressed: (int newIndex) {
                              setState(() {
                                for (int index = 0;
                                    index < operationTypeIsSelected.length;
                                    index++) {
                                  debugPrint(
                                      "Width: ${MediaQuery.of(context).size.width}");
                                  if (index == newIndex) {
                                    operationTypeIsSelected[index] = true;
                                  } else {
                                    operationTypeIsSelected[index] = false;
                                  }
                                }
                              });
                            },
                            children: [
                              Container(
                                alignment: Alignment.center,
                                //width: 100,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: const Text("BY HOUR"),
                              ),
                              Container(
                                alignment: Alignment.center,
                                //width: 100,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: const Text("BY QUANTITY"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
