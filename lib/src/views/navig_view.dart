import 'package:fitness_app/src/views/app_view.dart';
import 'package:fitness_app/src/views/current_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigView extends StatelessWidget {
  NavigView({Key? key}) : super(key: key);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentScreenProvider>(
      builder: (context, screenState, child) {
        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.chartLine),
                  label: 'Statistics',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.fire),
                  label: 'Hot',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.store),
                  label: 'Store',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.cog),
                  label: 'Settings',
                ),
              ],
              currentIndex: screenState.currentIndex,
              onTap: screenState.setCurrentScreen,
              selectedItemColor: Colors.amber[800],
              unselectedItemColor: Theme.of(context).primaryColor,
            ),
            body: AppView(currentScreenState: screenState.screenState));
      },
    );
  }
}
