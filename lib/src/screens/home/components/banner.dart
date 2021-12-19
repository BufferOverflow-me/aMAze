import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageBannerWithTextHavingOptacity extends StatelessWidget {
  const ImageBannerWithTextHavingOptacity({
    Key? key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.text,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorDark,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            imageUrl,
          ),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Colors.white54),
          ),
        ),
      ),
    );
  }
}
