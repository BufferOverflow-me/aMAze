import 'package:fitness_app/src/screens/settings/components/color_selector.dart';
import 'package:fitness_app/src/screens/settings/components/options.dart';
import 'package:fitness_app/src/screens/settings/setting_controller.dart';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:flutter/material.dart';

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
            OptionWidget(
              children: [
                ColorSelector(
                  color: Colors.white,
                  onTap: () => controller.updateThemeMode(ThemeMode.light),
                ),
                ColorSelector(
                  color: Colors.black,
                  onTap: () => controller.updateThemeMode(ThemeMode.dark),
                ),
              ],
              text: 'Theme',
            ),
            OptionWidget(
              children: [
                ColorSelector(color: Colors.black, onTap: () {}),
                ColorSelector(color: Colors.white, onTap: () {}),
                ColorSelector(color: Colors.purple, onTap: () {}),
              ],
              text: 'Color Schema',
            ),
            const Spacer(),
            ButtonBar(
              children: [
                TextButton(
                  onPressed: () {
                    ApplicationStateNotifier().signOut();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Logout',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    imageCache?.clear();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cache cleared!'),
                      ),
                    );
                  },
                  child: Text(
                    'Clear Cache',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: Colors.green),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
