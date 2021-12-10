import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'functions/greeting.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              FirebaseAuth.instance.currentUser?.displayName ?? 'Guest',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        CachedNetworkImage(
          imageUrl: FirebaseAuth.instance.currentUser?.photoURL ??
              'https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y',
          imageBuilder: (context, imageProvider) => Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              const Center(child: FaIcon(FontAwesomeIcons.user)),
        ),
      ],
    );
  }
}
