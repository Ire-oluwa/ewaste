import 'package:flutter/material.dart';

class OTPInput extends StatelessWidget {
  const OTPInput({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 61.0,
        child: TextField(
          controller: controller,
          autofocus: true,
          textAlign: TextAlign.center,
          maxLength: 1,
          textInputAction: TextInputAction.next,
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
          ),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
        ),
      ),
    );
  }
}
