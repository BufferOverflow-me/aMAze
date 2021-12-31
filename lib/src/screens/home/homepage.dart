import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/src/screens/home/components/functions/weekday.dart';
import 'package:fitness_app/src/screens/home/components/line_chart.dart';
import 'package:fitness_app/src/theme/values/global_vals.dart';
import 'package:flutter/material.dart';
import 'components/user_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
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
                const Padding(
                  padding: EdgeInsets.only(top: 18.0),
                  // TODO: If user clicks this chart, then navigate to the chart page
                  child: RepaintBoundary(
                    child: MyLineChart(),
                  ),
                ),
                // TODO: A list goes here
                // Here the list will be fetched from the firestore database
                // Db will have data in sub collections
                // Each sub collection will have a list of data
                // Task: Fetch the collections and then fetch the data from the sub collections
                // and then display the data in a list
              ],
            ),
          ),
        ),
        Text(weekday().toString()),
      ],
    );
  }
}

class MyImageContainer extends StatelessWidget {
  const MyImageContainer({
    Key? key,
    required this.height,
    required this.width,
    required this.imageUrl,
  }) : super(key: key);
  final double height;
  final double width;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(constRadius),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            filterQuality: FilterQuality.none,
            image: CachedNetworkImageProvider(
              imageUrl,
            ),
          ),
        ),
      ),
    );
  }
}
