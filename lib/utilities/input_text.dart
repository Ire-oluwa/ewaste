import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    this.keyboard,
    this.textHint,
    required this.hideText,
    required this.onChanged,
    this.errorWarning,
    required this.controller,
    required this.formatInput,
    this.icon,
    this.defaultText,
    this.labelText,
    this.maximumLength,
    this.helperText,
  }) : super(key: key);
  final TextInputType? keyboard;
  final String? textHint;
  final bool hideText;
  final String? errorWarning;
  final String? defaultText;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final List<TextInputFormatter> formatInput;
  final Widget? icon;
  final String? labelText;
  final String? helperText;
  final int? maximumLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        maxLength: maximumLength,
        autofocus: true,
        textInputAction: TextInputAction.next,
        controller: controller,
        inputFormatters: formatInput,
        obscureText: hideText,
        keyboardType: keyboard,
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xffF4F6F8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: textHint,
          errorText: errorWarning,
          prefixText: defaultText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: icon,
        ),
        onChanged: (value) {},
      ),
    );
  }
}
