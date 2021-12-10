import 'package:fitness_app/src/screens/components/line_chart.dart';
import 'package:fitness_app/src/screens/components/user_appbar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
