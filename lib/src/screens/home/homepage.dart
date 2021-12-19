import 'package:cached_network_image/cached_network_image.dart';
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
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      // TODO: If user clicks this chart, then navigate to the chart page
                      child: RepaintBoundary(
                        child: MyLineChart(),
                      ),
                    ),
                    // const Spacer(),
                    // Container(
                    //   height: size.height * 0.25,
                    //   width: size.width * 0.9,
                    //   decoration: BoxDecoration(
                    //     borderRadius: const BorderRadius.all(
                    //       Radius.circular(constRadius),
                    //     ),
                    //     color: Theme.of(context).primaryColorLight,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: images.length,
              itemBuilder: (context, index) => MyImageContainer(
                height: size.height * 0.2,
                width: size.width,
                imageUrl: images[index],
              ),
            )
          ],
        ),
      ),
    );
  }
}

final images = [
  'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2261477/pexels-photo-2261477.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/3253501/pexels-photo-3253501.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1552248/pexels-photo-1552248.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2475877/pexels-photo-2475877.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/703012/pexels-photo-703012.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/927437/pexels-photo-927437.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2105493/pexels-photo-2105493.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/2417510/pexels-photo-2417510.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://images.pexels.com/photos/1144864/pexels-photo-1144864.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
];

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
