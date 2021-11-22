import 'package:fitness_app/src/screens/auth/auth_page.dart';
import 'package:fitness_app/src/screens/homepage.dart';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:fitness_app/src/settings/setting_controller.dart';
import 'package:fitness_app/src/settings/settings_view.dart';
import 'package:fitness_app/src/theme/theme.dart';
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
            theme: MyTheme.lightTheme(),
            darkTheme: MyTheme.darkTheme(),
            themeMode: settingsController.themeMode,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    // case SampleItemDetailsView.routeName:
                    //   return const SampleItemDetailsView();
                    // case SampleItemListView.routeName:
                    default:
                      return const Auth();
                  }
                },
              );
            },
            // home: const Auth(),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
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
