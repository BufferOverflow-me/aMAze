import 'package:email_validator/email_validator.dart';
import 'package:fitness_app/src/screens/auth/widgets/auth_buttons.dart';
import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginInPage extends StatefulWidget {
  const LoginInPage({Key? key}) : super(key: key);

  @override
  State<LoginInPage> createState() => _LoginInPageState();
}

class _LoginInPageState extends State<LoginInPage> {
  final _formKey = GlobalKey<FormState>();

  // Text edit controllers for email, password
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthButton(icon: FontAwesomeIcons.google, onPressed: () {}),
                  AuthButton(icon: FontAwesomeIcons.phone, onPressed: () {}),
                ],
              ),
              TextFormField(
                controller: _emailController,
                style: TextStyle(fontSize: size.height * 0.03),
                obscureText: false,
                cursorColor: Theme.of(context).primaryColorLight,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  enabled: true,
                  label: const Text("Email"),
                  labelStyle: Theme.of(context).textTheme.headline4,
                  fillColor: Theme.of(context).primaryColorLight,
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColorLight, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColorDark, width: 3.0),
                  ),
                ),
                validator: (value) => EmailValidator.validate(value!)
                    ? null
                    : "Please enter a valid email",
              ),
              MyTextField(
                controller: _passwordController,
                hint: "Password",
                isobsecure: true,
                label: "Password",
                validatorString: "Please enter your password",
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 14,
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: CustomText(
                      title: 'Forget password?',
                      color: Colors.red,
                      fontSize: size.height * 0.015,
                    ),
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.065,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColorLight,
                    ),
                    child: Center(
                        child: CustomText(
                      title: "Login",
                      color: Theme.of(context).primaryColorDark,
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  final String hint;
  final String validatorString;
  final TextEditingController controller;
  final String label;
  final bool isobsecure;
  const MyTextField({
    Key? key,
    required this.hint,
    required this.validatorString,
    required this.controller,
    required this.label,
    this.isobsecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
      obscureText: isobsecure,
      cursorColor: Theme.of(context).primaryColorLight,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        enabled: true,
        label: Text(label),
        alignLabelWithHint: true,
        labelStyle: Theme.of(context).textTheme.headline4,
        fillColor: Theme.of(context).primaryColorLight,
        // hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColorLight, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).primaryColorDark, width: 1.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorString;
        }
        return null;
      },
    );
  }
}
