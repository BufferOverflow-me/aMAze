import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/src/app.dart';
import 'package:fitness_app/src/settings/setting_controller.dart';
import 'package:fitness_app/src/settings/settings_service.dart';
import 'package:flutter/material.dart';

void main() async {
  // ensure that widgets are being initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Initialize firebase
  await Firebase.initializeApp();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
