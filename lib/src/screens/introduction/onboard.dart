import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class AmazeIntroductionPage extends StatelessWidget {
  const AmazeIntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              image: buildImage('assets/svg/pushup_guy.svg', context),
              titleWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'aMAze',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Your Fitness Coach',
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Get a personalised workout plan based on your goals and preferences.',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              image: buildImage('assets/svg/yoga_lady.svg', context),
              titleWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'aMAze',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Your Yoga Expert',
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Attain control over your breath and help relax both your body and mind.',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              image: buildImage('assets/svg/meditating_lady.svg', context),
              titleWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'aMAze',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Your Meditation Guru',
                        style: Theme.of(context).textTheme.headline4,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              bodyWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Attain peace of mind and find the person inside you, by meditating daily!',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              decoration: getPageDecoration(),
            ),
          ],
          dotsDecorator: getDotDecorator(context),
          done: CustomText(
            title: 'Get Started',
            color: Theme.of(context).primaryColorLight,
          ),
          skip: CustomText(
            title: 'Skip',
            color: Theme.of(context).primaryColorLight,
          ),
          next: Icon(
            Icons.arrow_forward,
            color: Theme.of(context).primaryColorLight,
          ),
          onSkip: () {
            // Route this to login page.
          },
          onDone: () {
            // Route this to login page.
          },
          showDoneButton: true,
          showSkipButton: true,
          showNextButton: true,
        ),
      ),
    );
  }

  DotsDecorator getDotDecorator(BuildContext context) => DotsDecorator(
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        activeColor: Theme.of(context).primaryColorLight,
        color: Colors.grey,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
      );

  Widget buildImage(String path, BuildContext context) => SvgPicture.asset(
        path,
        height: MediaQuery.of(context).size.height * 0.4,
      );

  PageDecoration getPageDecoration() => const PageDecoration(
        bodyAlignment: Alignment.bottomLeft,
        imageAlignment: Alignment.bottomCenter,
        imagePadding: EdgeInsets.only(bottom: 0),
      );
}
