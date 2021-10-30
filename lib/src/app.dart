import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/screens/auth/auth_page.dart';
import 'package:fitness_app/src/screens/homepage.dart';
import 'package:fitness_app/src/services/flutterfire.dart';
import 'package:fitness_app/src/settings/setting_controller.dart';
import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.settingsController}) : super(key: key);
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: FlutterFire())],
      child: AnimatedBuilder(
          animation: settingsController,
          builder: (BuildContext context, Widget? child) {
            // FlutterFire provider =
            //     Provider.of<FlutterFire>(context, listen: false);
            // bool busyState = context.watch<FlutterFire>().isBusy;
            // bool loggedInState = context.watch<FlutterFire>().isLogged;

            return MaterialApp(
              theme: MyTheme.greenLightTheme(),
              darkTheme: MyTheme.darkBlueTheme(),
              themeMode: settingsController.themeMode,
              debugShowCheckedModeBanner: false,
              home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, AsyncSnapshot<User?> user) {
                  if (!user.hasData) {
                    return const AuthPage();
                  }
                  if (user.hasData) {
                    return const HomePage();
                  }
                  return const CircularProgressIndicator();
                },
              ),
            );
          }),
    );
  }
}
