import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import '/model/add_person_modal_bottom_sheet_custom_app_bar.dart';
import '/model/custom_role_picker.dart';
import '/model/custom_text_form_field.dart';
import '/model/notes_text_form_field.dart';
import '/model/operations_list_view.dart';
import '/model/password_text_form_field.dart';
import '/model/realm_models.dart';

class AddPersonModalBottomSheet extends StatefulWidget {
  const AddPersonModalBottomSheet({
    super.key,
    required this.realm,
    required this.scaffoldKey,
    required this.heightToUse,
    required this.operationItems,
  });

  final Realm realm;
  final RealmResults<Operation> operationItems;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double heightToUse;

  @override
  State<AddPersonModalBottomSheet> createState() =>
      _AddPersonModalBottomSheetState();
}

String selectedRole = "";
const List rolePickerData = [
  [
    "Employee",
    "Administrator",
  ]
];

class _AddPersonModalBottomSheetState extends State<AddPersonModalBottomSheet> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController pickerController;
  late TextEditingController passwordController;
  late TextEditingController noteController;
  late FocusNode firstNameFocusNode;
  late FocusNode lastNameFocusNode;

  void updateSelectedRole(String role) {
    setState(() {
      selectedRole = role;
    });
  }

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    pickerController = TextEditingController();
    passwordController = TextEditingController();
    noteController = TextEditingController();
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    pickerController.dispose();
    passwordController.dispose();
    noteController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstNameFormFieldKey = GlobalKey<FormFieldState>();
    final lastNameFormFieldKey = GlobalKey<FormFieldState>();
    final pickerFormFieldKey = GlobalKey<FormFieldState>();

    CustomRolePicker picker = CustomRolePicker(
      formFieldKey: pickerFormFieldKey,
      controller: pickerController,
      rolePickerItems: rolePickerData,
      onRoleChanged: (String newRole) {
        updateSelectedRole(newRole);
      },
    );

    var scanedNfcTagValue = Uint8List.fromList([0, 1, 2, 3]);

    final operationListView = OperationsListView(
        realm: widget.realm, operationItems: widget.operationItems);

    List<Operation> selectedOperationsList =
        operationListView.getSelectedItemsList();

    bool selectedOperationListChanged =
        operationListView.selectedItemsListLengthChanged();

    debugPrint("Num. of selected items: ${selectedOperationsList.length}");
    debugPrint("Selected op. state change: $selectedOperationListChanged");

    if (selectedOperationListChanged) {
      debugPrint("selected state changed");
      setState(() {
        selectedOperationsList = OperationsListView(
                realm: widget.realm, operationItems: widget.operationItems)
            .getSelectedItemsList();
      });
    }

    return SizedBox(
      height: widget.heightToUse,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ModalBottomSheetCustomAppBar(
              firstNameController: firstNameController,
              lastNameController: lastNameController,
              passwordController: passwordController,
              noteController: noteController,
              picker: picker),
          // Body of AdminPanelView - AddPerson ModalBottomSheet
          SizedBox(
            height: widget.heightToUse - 40,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // First name TextFormField (Required entry).
                  CustomTextFormField(
                    controller: firstNameController,
                    labelText: "First Name*",
                    validatorErrorText: "First name is required to proceed!",
                    formFieldKey: firstNameFormFieldKey,
                    focusNode: firstNameFocusNode,
                  ),
                  // Last name TextFormField (Required entry).
                  CustomTextFormField(
                    controller: lastNameController,
                    labelText: "Last Name*",
                    validatorErrorText: "Last name is required to proceed!",
                    formFieldKey: lastNameFormFieldKey,
                    focusNode: lastNameFocusNode,
                  ),
                  picker,
                  // Password TextFormField - show only if administrator is selected,
                  // (Required entry if administrator is selected).
                  selectedRole == "Administrator"
                      ? PasswordTextFormField(controller: passwordController)
                      : const SizedBox(
                          height: 1,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Notes TextFormField (Optional entry, can be left empty).
                  NotesTextFormField(controller: noteController),
                  picker.getSelectedRole() == "Employee"
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20)),
                            child: OperationsListView(
                              realm: widget.realm,
                              operationItems: widget.operationItems,
                            ),
                          ),
                        )
                      : const SizedBox(
                          height: 1,
                        ),
                  // Scan ElevatedButton (Required, NFC tag must be scaned).
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () => {
                          scanedNfcTagValue = Uint8List.fromList(
                              [0, 2, 1, 3, 5, 6, 7, 5, 3, 3, 5, 7, 5, 3, 2]),
                          debugPrint(
                              "Current scanedNfcValue is: $scanedNfcTagValue")
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        child: const Text(
                          "Scan",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  // Add person ElevatedButton (Can only add a person if all the,
                  // requirements from above are fufiled
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => {
                          if (!firstNameFormFieldKey.currentState!.isValid)
                            {firstNameFormFieldKey.currentState!.validate()},
                          if (!lastNameFormFieldKey.currentState!.isValid)
                            {lastNameFormFieldKey.currentState!.validate()},
                          if (!pickerFormFieldKey.currentState!.isValid)
                            {pickerFormFieldKey.currentState!.validate()},
                          widget.realm.write(() => widget.realm.add(Worker(
                              ObjectId(),
                              "com.gogoencode.trackme",
                              firstNameController.text,
                              false,
                              lastNameController.text,
                              scanedNfcTagValue,
                              picker.getSelectedRole(),
                              note: noteController.text,
                              password:
                                  picker.getSelectedRole() == "Administrator"
                                      ? passwordController.text
                                      : null,
                              jobs: <Job>[],
                              operations: selectedOperationsList)))
                        },
                        child: const Text(
                          "Add person",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom + 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
