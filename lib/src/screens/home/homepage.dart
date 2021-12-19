import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/src/screens/home/components/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'components/line_chart.dart';
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
                      // TODO: If user clicks this chart, then navigate to the chart page
                      child: MyLineChart(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ImageBannerWithTextHavingOptacity(
                height: size.height * 0.17,
                width: size.width,
                imageUrl:
                    'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress',
                text: 'Full Body',
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: ImageBannerWithTextHavingOptacity(
                height: size.height * 0.17,
                width: size.width,
                imageUrl:
                    'https://images.pexels.com/photos/6295965/pexels-photo-6295965.jpeg?auto=compress',
                text: 'Cardio',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 16.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: ImageBannerWithTextHavingOptacity(
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            imageUrl:
                                'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress',
                            text: 'Full Body',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: ImageBannerWithTextHavingOptacity(
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            imageUrl:
                                'https://images.pexels.com/photos/6295965/pexels-photo-6295965.jpeg?auto=compress',
                            text: 'Cardio',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: ImageBannerWithTextHavingOptacity(
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            imageUrl:
                                'https://images.pexels.com/photos/2294361/pexels-photo-2294361.jpeg?auto=compress',
                            text: 'Full Body',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 8.0,
                          ),
                          child: ImageBannerWithTextHavingOptacity(
                            height: size.height * 0.25,
                            width: size.width * 0.5,
                            imageUrl:
                                'https://images.pexels.com/photos/6295965/pexels-photo-6295965.jpeg?auto=compress',
                            text: 'Cardio',
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
