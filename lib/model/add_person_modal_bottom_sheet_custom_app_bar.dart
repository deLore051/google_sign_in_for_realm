import 'package:flutter/material.dart';
import '/model/custom_role_picker.dart';

class ModalBottomSheetCustomAppBar extends StatefulWidget {
  const ModalBottomSheetCustomAppBar({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.noteController,
    required this.picker,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController noteController;
  final CustomRolePicker picker;

  @override
  State<ModalBottomSheetCustomAppBar> createState() =>
      _ModalBottomSheetCustomAppBarState();
}

class _ModalBottomSheetCustomAppBarState
    extends State<ModalBottomSheetCustomAppBar> {
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
                    widget.firstNameController.clear();
                    widget.lastNameController.clear();
                    widget.passwordController.clear();
                    widget.noteController.clear();
                    widget.picker.controller.clear();
                    selectedRole = "";
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
                "Add person",
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
