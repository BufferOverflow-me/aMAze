import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/src/app.dart';
import 'package:fitness_app/src/screens/settings/setting_controller.dart';
import 'package:fitness_app/src/screens/settings/settings_service.dart';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:fitness_app/src/services/user_provider.dart';
import 'package:fitness_app/src/theme/colorService.dart';
import 'package:fitness_app/src/theme/color_controller.dart';
import 'package:fitness_app/src/views/current_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  // ensure that widgets are being initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Load the colors
  final userColor = ColorController(ColorService());
  await userColor.loadColor();

  // Initialize firebase
  await Firebase.initializeApp();
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  // Set Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ApplicationStateNotifier>(
          create: (_) => ApplicationStateNotifier()),
      ChangeNotifierProvider<CurrentScreenProvider>(
          create: (_) => CurrentScreenProvider()),
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
      ChangeNotifierProvider<ColorController>(
          create: (_) => ColorController(ColorService())),
    ],
    child: MyApp(
      settingsController: settingsController,
    ),
  ));
}
