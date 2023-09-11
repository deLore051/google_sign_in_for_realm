import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

//typedef void SelectedRoleCallback(String selectedRole);
typedef SelectedRoleCallback = void Function(String selectedRole);

class CustomRolePicker extends StatefulWidget {
  final SelectedRoleCallback onRoleChanged;
  final TextEditingController controller;
  final GlobalKey<FormFieldState> formFieldKey;
  final List rolePickerItems;

  const CustomRolePicker({
    super.key,
    required this.controller,
    required this.onRoleChanged,
    required this.formFieldKey,
    required this.rolePickerItems,
  });

  void setselectedRole() {
    selectedRole = "";
  }

  String getSelectedRole() {
    return selectedRole;
  }

  @override
  State<CustomRolePicker> createState() => _CustomRolePickerState();
}

String selectedRole = "";

class _CustomRolePickerState extends State<CustomRolePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        initialValue: selectedRole == "" ? "Tap to select role*" : selectedRole,
        key: widget.formFieldKey,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        style: selectedRole == "" || selectedRole == "Tap to select role*"
            ? TextStyle(color: Colors.grey.shade600)
            : const TextStyle(color: Colors.black),
        keyboardType: TextInputType.none,
        textInputAction: null,
        readOnly: true,
        scrollPadding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: InputDecoration(
            labelText:
                selectedRole == "" ? "Tap to select role*" : selectedRole,
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade600, width: 1.5),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    selectedRole == "Tap to select role*" || selectedRole == ""
                        ? const BorderSide(color: Colors.red)
                        : BorderSide(color: Colors.grey.shade500),
                borderRadius: BorderRadius.circular(20)),
            floatingLabelBehavior: FloatingLabelBehavior.never),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) {
          if (value == null || value == "" || value == "Tap to select role*") {
            debugPrint("border should be red, value: $value");
            return "Role must be selected to proceed!";
          }
          debugPrint("border should be grey, value: $value");
          return null;
        },
        onTap: () => showPicker(context),
        //onSaved: (newValue) => newValue = selectedRole,
      ),
    );
  }

  showPicker(BuildContext context) async {
    List rolePickerData = widget.rolePickerItems;
    Picker(
      adapter:
          PickerDataAdapter<String>(pickerData: rolePickerData, isArray: true),
      title: const Text("Tap to select role*"),
      changeToFirst: true,
      cancelTextStyle: const TextStyle(color: Colors.red),
      textAlign: TextAlign.center,
      columnPadding: const EdgeInsets.all(10),
      onCancel: () {
        setState(() {
          selectedRole = "Tap to select role*";
          widget.onRoleChanged(selectedRole);
          widget.formFieldKey.currentState!.validate() ? "123" : "321";
        });
      },
      onConfirm: (Picker picker, List value) {
        setState(() {
          selectedRole = picker.adapter.getSelectedValues()[0];
          widget.onRoleChanged(selectedRole);
          debugPrint("onConfirm selectedRole: $selectedRole");
          widget.controller.text = selectedRole;
          widget.formFieldKey.currentState!.save();
        });
      },
    ).showModal(this.context);
  }
}
