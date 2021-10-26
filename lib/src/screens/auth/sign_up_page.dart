import 'package:fitness_app/src/screens/auth/login_page.dart';
import 'package:fitness_app/src/screens/auth/widgets/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  int currentStep = 0;

  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  TextEditingController _ConfirmPasswordController = TextEditingController();
  TextEditingController _PhoneController = TextEditingController();

  List<Step> getSteps(context) => [
        Step(
          title: Text(
            'Name',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: _NameController,
            hint: "Name",
            label: "Name",
            validatorString: "Name",
            isobsecure: false,
          ),
        ),
        Step(
          title: Text(
            'Email',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: _EmailController,
            hint: "Email",
            label: "Email",
            validatorString: "Email",
            keyboardType: TextInputType.emailAddress,
            isobsecure: false,
          ),
        ),
        Step(
          title: Text(
            'Phone',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: _PhoneController,
            hint: "Phone",
            label: "Phone",
            validatorString: "Phone",
            keyboardType: TextInputType.number,
            isobsecure: false,
          ),
        ),
        Step(
          title: Text(
            'Password',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: _PasswordController,
            hint: "Password",
            label: "Password",
            validatorString: "Password",
            isobsecure: true,
          ),
        ),
        Step(
          title: Text(
            'Confirm Password',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: _ConfirmPasswordController,
            hint: "Confirm Password",
            label: "Confirm Password",
            validatorString: "Confirm Password",
            isobsecure: true,
          ),
        ),
      ];

  @override
  void dispose() {
    _NameController.dispose();
    _EmailController.dispose();
    _PasswordController.dispose();
    _ConfirmPasswordController.dispose();
    _PhoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stepper(
            currentStep: currentStep,
            steps: getSteps(context),
            onStepContinue: () {
              switch (currentStep) {
                case 0:
                  if (_NameController.text.isNotEmpty) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter your Name", context);
                  }
                  break;
                case 1:
                  if (_EmailController.text.isNotEmpty &&
                      _EmailController.text.contains(
                        '@',
                      ) &&
                      _EmailController.text.contains('.')) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter a valid email", context);
                  }
                  break;
                case 2:
                  if (_PhoneController.text.length > 10) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter a valid Phone Number", context);
                  }
                  break;
                case 3:
                  if (_PasswordController.text.length > 5) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter atleast 5 characters", context);
                  }
                  break;
                case 4:
                  if (_PasswordController.text.isNotEmpty &&
                      _PasswordController.text ==
                          _ConfirmPasswordController.text) {
                    showSnackBar("Done", context);
                    setState(() {});
                  } else {
                    showSnackBar("The password doesn't matches", context);
                  }
                  break;
                default:
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AuthButton(icon: FontAwesomeIcons.google, onPressed: () {}),
              AuthButton(icon: FontAwesomeIcons.facebook, onPressed: () {}),
              AuthButton(icon: FontAwesomeIcons.phone, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  void showSnackBar(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
