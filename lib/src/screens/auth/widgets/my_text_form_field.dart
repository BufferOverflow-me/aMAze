import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required TextEditingController controller,
    required String hint,
    required String validatorString,
    bool isObsecure = false,
  })  : _controller = controller,
        hintText = hint,
        validatorText = validatorString,
        obscureText = isObsecure,
        super(key: key);

  final TextEditingController _controller;
  final String hintText;
  final String validatorText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: hintText,
        ),
        obscureText: obscureText,
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    );
  }
}
