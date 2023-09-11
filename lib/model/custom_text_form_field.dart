import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.validatorErrorText,
    required this.formFieldKey,
    required this.focusNode,
  });

  final TextEditingController controller;
  final String labelText;
  final String validatorErrorText;
  final GlobalKey<FormFieldState> formFieldKey;
  final FocusNode focusNode;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

String textFormFieldValue = "";

/// -> TODO: Need to fix the changes of border states when the text field is empty it
/// should be red, when it gains focus it should be blue and when we input some value
/// it should be gray. When the add person button is pressed we start the validation
/// proccess for all test form fields and if any of them is empty still at that point
/// bellow that field errorText will be shown, this will also happen if we enter some
/// value, delete it and after that remove focus from that field.
class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void checkTextFormFieldFocus() {
    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        debugPrint("${widget.labelText} lost focus");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Focus(
          child: TextFormField(
            key: widget.formFieldKey,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            focusNode: widget.focusNode,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            decoration: InputDecoration(
              labelText: widget.labelText,
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
              enabledBorder:
                  textFormFieldValue == "" || textFormFieldValue.isEmpty
                      ? OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(20))
                      : OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500),
                          borderRadius: BorderRadius.circular(20)),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelAlignment: FloatingLabelAlignment.start,
            ),
            validator: (String? value) {
              if (value == null || value == "") {
                return widget.validatorErrorText;
              }
              return null;
            },
            textInputAction: TextInputAction.next,
            autocorrect: false,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onEditingComplete: () {
              debugPrint(
                  "${widget.labelText} entered value: ${widget.controller.text}");
              FocusScope.of(context).nextFocus();
            },
          ),
          onFocusChange: (hasFocus) {
            if (!hasFocus) {
              setState(() {
                textFormFieldValue = widget.controller.text;
              });
            }
          },
        ));
  }
}
