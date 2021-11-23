import 'package:fitness_app/src/screens/auth/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';

import '../widgets/auth_buttons.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    required this.login,
    required this.email,
    Key? key,
  }) : super(key: key);
  final String email;
  final void Function(String email, String password) login;
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header('Sign in'),
          Image.asset(
            'assets/images/PettingDoodle.png',
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyTextFormField(
                      controller: _emailController,
                      hint: 'Enter your email',
                      validatorString: 'Enter your email address to continue'),
                  MyTextFormField(
                    controller: _passwordController,
                    hint: 'Password',
                    isObsecure: true,
                    validatorString: 'Enter your password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: StyledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            widget.login(
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                        child: const Text('SIGN IN'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
