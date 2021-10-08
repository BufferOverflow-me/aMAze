import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "Body Text 1",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "Body Text 1",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Text(
              "caption",
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              "overline",
              style: Theme.of(context).textTheme.overline,
            ),
            Text(
              "subtitle1",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "subtitle2",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              "button",
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
    );
  }
}
