import 'dart:developer';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              ApplicationStateNotifier().signInWithGoogle((e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.toString()),
                ));
                log(e.toString());
                // ShowErrorDialog(title: 'Something went Wrong', e: e);
              });
            },
            icon: const FaIcon(FontAwesomeIcons.google),
          ),
          IconButton(
            onPressed: () {
              ApplicationStateNotifier().signInWithFacebook((e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.toString()),
                  // duration: const Duration(minutes: 2),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                  ),
                ));
                log(e.toString());
              });
            },
            icon: const FaIcon(FontAwesomeIcons.facebook),
          ),
          IconButton(
              onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.phone)),
        ],
      ),
    );
  }
}
