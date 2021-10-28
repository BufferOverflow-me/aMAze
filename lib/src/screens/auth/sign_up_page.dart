import 'package:fitness_app/src/screens/auth/login_page.dart';
import 'package:fitness_app/src/screens/auth/widgets/auth_buttons.dart';
import 'package:fitness_app/src/screens/homepage.dart';
import 'package:fitness_app/src/services/flutterfire.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  int currentStep = 0;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  List<Step> getSteps(context) => [
        Step(
          title: Text(
            'Name',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: nameController,
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
            controller: emailController,
            hint: "Email",
            label: "Email",
            validatorString: "Email",
            keyboardType: TextInputType.emailAddress,
            isobsecure: false,
          ),
        ),
        // Step(
        //   title: Text(
        //     'Phone',
        //     style: Theme.of(context).textTheme.headline5,
        //   ),
        //   content: MyTextField(
        //     controller: phoneController,
        //     hint: "Phone",
        //     label: "Phone",
        //     validatorString: "Phone",
        //     keyboardType: TextInputType.number,
        //     isobsecure: false,
        //   ),
        // ),
        Step(
          title: Text(
            'Password',
            style: Theme.of(context).textTheme.headline5,
          ),
          content: MyTextField(
            controller: passwordController,
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
            controller: confirmPasswordController,
            hint: "Confirm Password",
            label: "Confirm Password",
            validatorString: "Confirm Password",
            isobsecure: true,
          ),
        ),
      ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    // phoneController.dispose();
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
            onStepCancel: () {
              if (currentStep > 0) {
                setState(() {
                  currentStep -= 1;
                });
              }
            },
            onStepContinue: () async {
              switch (currentStep) {
                case 0:
                  if (nameController.text.isNotEmpty) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter your Name", context);
                  }
                  break;
                case 1:
                  if (emailController.text.isNotEmpty &&
                      emailController.text.contains(
                        '@',
                      ) &&
                      emailController.text.contains('.')) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter a valid email", context);
                  }
                  break;
                // case 2:
                //   if (phoneController.text.length > 10) {
                //     currentStep = currentStep + 1;
                //     setState(() {});
                //   } else {
                //     showSnackBar("Please enter a valid Phone Number", context);
                //   }
                //   break;
                case 2:
                  if (passwordController.text.length > 5) {
                    currentStep = currentStep + 1;
                    setState(() {});
                  } else {
                    showSnackBar("Please enter atleast 5 characters", context);
                  }
                  break;
                case 3:
                  if (passwordController.text.isNotEmpty &&
                      passwordController.text ==
                          confirmPasswordController.text) {
                    bool isRegistered = await register(nameController.text,
                        emailController.text, passwordController.text);
                    if (isRegistered == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Error"),
                            content: const Text(
                                "Something gone wrong, please try again"),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
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
