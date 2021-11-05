import 'package:fitness_app/src/screens/auth/auth_page.dart';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:fitness_app/src/settings/setting_controller.dart';
import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.settingsController}) : super(key: key);
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            theme: MyTheme.greenLightTheme(),
            darkTheme: MyTheme.darkBlueTheme(),
            themeMode: settingsController.themeMode,
            debugShowCheckedModeBanner: false,
            home: const Auth(),
          );
        });
  }
}

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyTheme.appName),
      ),
      body: ListView(
        children: [
          Consumer<ApplicationStateNotifier>(
              builder: (context, appState, child) => Authentication(
                    email: appState.email,
                    loginState: appState.loginState,
                    startLoginFlow: appState.startLoginFlow,
                    verifyEmail: appState.verifyEmail,
                    signInWithEmailAndPassword:
                        appState.signInWithEmailAndPassword,
                    cancelRegistration: appState.cancelRegistration,
                    registerAccount: appState.registerAccount,
                    signOut: appState.signOut,
                  )),
        ],
      ),
    );
  }
}
