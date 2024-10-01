import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class AnimatedNetworkImage extends StatelessWidget {
  final String tag;
  final String image;
  final double? width;
  final double? height;

  const AnimatedNetworkImage({
    super.key,
    required this.tag,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: image,
        width: width,
        height: height,
        fit: BoxFit.fill,
      ),
    );
  }
}
