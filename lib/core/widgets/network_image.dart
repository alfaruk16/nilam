import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageB extends StatelessWidget {
  const NetworkImageB(
      {super.key, required this.imageUrl, this.iconSize, this.preview = false});

  final String imageUrl;
  final double? iconSize;
  final bool preview;

  @override
  Widget build(BuildContext context) {
    return NetWorkImageViewB(
      imageUrl: imageUrl,
      iconSize: iconSize,
    );
  }
}

class NetWorkImageViewB extends StatelessWidget {
  const NetWorkImageViewB({super.key, required this.imageUrl, this.iconSize});
  final String imageUrl;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => FittedBox(
        child: Icon(
          Icons.image,
          size: iconSize,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
      errorWidget: (context, url, error) => FittedBox(
        child: Icon(
          Icons.error,
          size: iconSize,
          color: Colors.red.withOpacity(0.8),
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}
