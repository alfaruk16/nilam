import 'package:flutter/material.dart';
import 'package:nilam/core/widgets/network_image.dart';

Future showNetworkImage(BuildContext context, {required String imageUrl}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: NetWorkImageViewB(
          imageUrl: imageUrl,
        ));
      });
}
