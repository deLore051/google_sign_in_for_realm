import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  const PasswordTextFormField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

bool obsucreText = true;

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextFormField(
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 50),
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        cursorHeight: 15,
        controller: widget.controller,
        textCapitalization: TextCapitalization.none,
        obscureText: obsucreText,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 20, 15, 12),
            prefixIcon: const Icon(
              Icons.lock,
              size: 20,
            ),
            suffix: Container(
              alignment: Alignment.center,
              height: 25,
              width: 25,
              child: IconButton(
                  alignment: Alignment.center,
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      if (obsucreText == true) {
                        obsucreText = false;
                      } else {
                        obsucreText = true;
                      }
                    });
                  },
                  icon: Icon(
                    obsucreText ? Icons.password_sharp : Icons.abc_sharp,
                    size: 20,
                  )),
            ),
            labelText: "Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelAlignment: FloatingLabelAlignment.start),
        validator: (String? value) {
          if (value == null || value == "") {
            return "Enter password";
          }
          return null;
        },
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
