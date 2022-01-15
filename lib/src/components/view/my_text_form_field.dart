import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    required TextEditingController controller,
    required String hint,
    required String validatorString,
    bool isObsecure = false,
    this.keyboardType = TextInputType.text,
  })  : _controller = controller,
        hintText = hint,
        validatorText = validatorString,
        obscureText = isObsecure,
        super(key: key);

  final TextEditingController _controller;
  final String hintText;
  final String validatorText;
  final bool obscureText;
  final TextInputType keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: TextFormField(
        controller: _controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.headline6,
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
