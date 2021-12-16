import 'package:flutter/material.dart';
import 'components/line_chart.dart';
import 'components/user_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height * 0.4,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(150),
          ),
        ),
        child: Padding(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
