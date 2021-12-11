import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/screens/settings/components/color_selector.dart';
import 'package:fitness_app/src/screens/settings/setting_controller.dart';
import 'package:fitness_app/src/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Theme',
                  style: Theme.of(context).textTheme.button,
                ),
                Row(
                  children: [
                    ColorSelector(
                        color: Colors.white,
                        onTap: () {
                          controller.updateThemeMode(ThemeMode.light);
                        }),
                    ColorSelector(
                        color: Colors.black,
                        onTap: () {
                          controller.updateThemeMode(ThemeMode.dark);
                        }),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Color Schema',
                  style: Theme.of(context).textTheme.button,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColorSelector(color: Colors.black, onTap: () {}),
                    ColorSelector(color: Colors.white, onTap: () {}),
                    ColorSelector(color: Colors.purple, onTap: () {}),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
