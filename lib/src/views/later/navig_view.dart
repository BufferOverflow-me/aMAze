import 'package:fitness_app/src/views/app_view.dart';
import 'package:fitness_app/src/views/current_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigView extends StatelessWidget {
  const NavigView({Key? key}) : super(key: key);

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
                  icon: FaIcon(FontAwesomeIcons.fire),
                  label: 'Hot',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.store),
                  label: 'Store',
                ),
              ],
              currentIndex: screenState.currentIndex,
              onTap: screenState.setCurrentScreen,
              selectedItemColor: Theme.of(context).backgroundColor,
              unselectedItemColor: Theme.of(context).primaryColor,
            ),
            body: AppView(currentScreenState: screenState.screenState));
      },
    );
  }
}
