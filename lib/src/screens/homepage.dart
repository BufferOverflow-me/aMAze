import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greeting(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser?.displayName ??
                            'Guest',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  CachedNetworkImage(
                    imageUrl: FirebaseAuth.instance.currentUser?.photoURL ??
                        'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String greeting() {
  if (DateTime.now().hour < 12) {
    return 'Good Morning,';
  } else if (DateTime.now().hour < 16) {
    return 'Good Afternoon,';
  } else if (DateTime.now().hour < 22) {
    return 'Good Evening,';
  } else {
    return 'Good Night,';
  }
}
