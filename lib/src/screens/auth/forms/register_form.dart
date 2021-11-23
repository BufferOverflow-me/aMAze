import 'package:fitness_app/src/screens/auth/widgets/auth_buttons.dart';
import 'package:fitness_app/src/screens/auth/widgets/my_text_form_field.dart';
import 'package:fitness_app/src/screens/auth/widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.registerAccount,
    required this.cancel,
    required this.email,
    Key? key,
  }) : super(key: key);
  final String email;
  final void Function(String email, String displayName, String password)
      registerAccount;
  final void Function() cancel;
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_RegisterFormState');
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header('Create account'),
          Image.asset(
            'assets/images/SelfieDoodle.png',
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MyTextFormField(
                      controller: _emailController,
                      hint: 'Email',
                      validatorString: 'Enter your email to continue'),
                  MyTextFormField(
                      controller: _displayNameController,
                      hint: 'First & last name',
                      validatorString: 'Enter your name'),
                  MyTextFormField(
                    controller: _passwordController,
                    hint: 'Password',
                    validatorString: 'Enter your Password',
                    isObsecure: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: widget.cancel,
                          child: const Text('CANCEL'),
                        ),
                        StyledButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              widget.registerAccount(
                                _emailController.text,
                                _displayNameController.text,
                                _passwordController.text,
                              );
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SocialButtons(),
          )
        ],
      ),
    );
  }
}
