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
          // TODO: Write code for these buttons
          IconButton(
            onPressed: () {
              ApplicationStateNotifier().signInWithGoogle((e) {
                log(e.toString());
                // ShowErrorDialog(title: 'Something went Wrong', e: e);
              });
            },
            icon: const FaIcon(FontAwesomeIcons.google),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebook),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.twitter),
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.github),
          ),
        ],
      ),
    );
  }
}
