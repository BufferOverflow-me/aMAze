import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'components/line_chart.dart';
import 'components/user_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    const List<Widget> _widgetOptions = [
      Text(
        'Index 0: Home',
      ),
      Text(
        'Index 1: Business',
      ),
      Text(
        'Index 2: School',
      ),
    ];
    Size size = MediaQuery.of(context).size;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            UserAppBar(
              onPressed: () {
                Navigator.restorablePushNamed(context, '/settings');
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: MyLineChart(),
            )
          ],
        ),
      ),
    );
  }
}
