import 'package:fitness_app/src/screens/auth/auth_page.dart';
import 'package:fitness_app/src/screens/settings/tools/setting_controller.dart';
import 'package:fitness_app/src/screens/settings/view/settings_view.dart';
import 'package:fitness_app/src/screens/workout/workout.dart';
import 'package:fitness_app/src/services/authentication.dart';
import 'package:fitness_app/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    case Auth.routeName:
                      return const Auth();
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
  static const routeName = '/Auth';

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationStateNotifier>(
        builder: (context, appState, child) => Scaffold(
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.light.copyWith(
                  statusBarColor: Theme.of(context).primaryColor,
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        children: [
                          // Top section
                          Positioned(
                            right: -30,
                            top: -10,
                            child: SvgPicture.asset(
                              'assets/svg/curved_rectangle.svg',
                              height: 100,
                            ),
                          ),
                          Positioned(
                            top: -15,
                            right: 15,
                            child: SvgPicture.asset(
                              'assets/svg/curved_rectangle.svg',
                              height: 100,
                            ),
                          ),

                          // Bottom section
                          Positioned(
                            bottom: -10,
                            left: -30,
                            child: SvgPicture.asset(
                              'assets/svg/curved_rectangle.svg',
                              height: 100,
                            ),
                          ),
                          Positioned(
                            left: 15,
                            bottom: -10,
                            child: SvgPicture.asset(
                              'assets/svg/curved_rectangle.svg',
                              height: 100,
                            ),
                          ),
                          Authentication(
                            email: appState.email,
                            loginState: appState.loginState,
                            startLoginFlow: appState.startLoginFlow,
                            verifyEmail: appState.verifyEmail,
                            signInWithEmailAndPassword:
                                appState.signInWithEmailAndPassword,
                            cancelRegistration: appState.cancelRegistration,
                            registerAccount: appState.registerAccount,
                            signOut: appState.signOut,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
