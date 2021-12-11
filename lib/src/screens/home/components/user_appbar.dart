import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/src/services/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'functions/greeting.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  // On tap callback.
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => Consumer<UserProvider>(
        builder: (context, user, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greeting(),
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    user.userName,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
              InkWell(
                onTap: onPressed,
                child: CachedNetworkImage(
                  imageUrl: user.userImageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 40,
                    height: 40,
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
                      const Center(child: FaIcon(FontAwesomeIcons.user)),
                ),
              ),
            ],
          );
        },
      );
}
