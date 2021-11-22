import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/src/settings/settings_view.dart';
import 'package:fitness_app/src/theme/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

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
      body: Column(
        children: [
          const Center(child: Text('HomePage')),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Log Out'))
        ],
      ),
    );
  }
}
