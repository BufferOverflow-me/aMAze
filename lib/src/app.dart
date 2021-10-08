import 'package:fitness_app/src/screens/homepage.dart';
import 'package:fitness_app/src/settings/setting_controller.dart';
import 'package:fitness_app/src/settings/settings_service.dart';
import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.settingsController}) : super(key: key);
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: MyTheme.greenLightTheme(context),
            darkTheme: MyTheme.darkBlueTheme(),
            themeMode: settingsController.themeMode,
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        });
  }
}
