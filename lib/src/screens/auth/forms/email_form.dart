import 'package:fitness_app/src/components/components.dart';
import 'package:fitness_app/src/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({required this.callback, Key? key}) : super(key: key);
  final void Function(String email) callback;
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _formKey = GlobalKey<FormState>(debugLabel: '_EmailFormState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Header('Sign in with email'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svg/fitness_tracker.svg',
                  height: 400,
                ),
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: Theme.of(context).textTheme.headline6,
                    // Green colored border
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) {
                    //  Validate if the given string is email
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: StyledButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          widget.callback(_controller.text);
                        }
                      },
                      child: Text(
                        'NEXT',
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Social buttons
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 32.0),
          child: SocialButtons(),
        )
      ],
    );
  }
}
