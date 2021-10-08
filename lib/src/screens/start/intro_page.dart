import 'package:fitness_app/src/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
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
              image: SvgPicture.asset(
                "assets/svg/pushup_guy.svg",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              titleWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "aMAze",
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
                  "Get a personalised workout plan based on your goals and preferences.",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              decoration: const PageDecoration(
                bodyAlignment: Alignment.bottomLeft,
                imageAlignment: Alignment.bottomCenter,
              ),
            ),
            PageViewModel(
              image: SvgPicture.asset(
                "assets/svg/yoga_lady.svg",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              titleWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "aMAze",
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
                  "Attain control over your breath and help relax both your body and mind.",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              decoration: const PageDecoration(
                bodyAlignment: Alignment.bottomLeft,
                imageAlignment: Alignment.bottomCenter,
              ),
            ),
            PageViewModel(
              image: SvgPicture.asset(
                "assets/svg/meditating_lady.svg",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              titleWidget: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "aMAze",
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
                  "Attain peace of mind and find the person inside you, by meditating daily!",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              decoration: const PageDecoration(
                bodyAlignment: Alignment.bottomLeft,
                imageAlignment: Alignment.bottomCenter,
              ),
            ),
          ],
          done: Text(
            "Done",
            style: Theme.of(context).textTheme.headline5,
          ),
          onDone: () {},
          next: const Text(
            "Next",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          showNextButton: false,
        ),
      ),
    );
  }
}
