import 'package:fitness_app/src/theme/values/global_vals.dart';
import 'package:flutter/material.dart';
import 'components/user_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              decoration: BoxDecoration(
                gradient: myGradient(context),
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
                    // Padding(
                    //   padding: EdgeInsets.only(top: 18.0),
                    //   // TODO: If user clicks this chart, then navigate to the chart page
                    //   child: MyLineChart(),
                    // ),
                    const Spacer(),
                    Container(
                      height: size.height * 0.25,
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(constRadius),
                        ),
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
