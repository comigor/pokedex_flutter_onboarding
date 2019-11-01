import 'package:flutter/material.dart';

class ToggledImage extends StatelessWidget {
  final bool colorized;
  final String url;

  ToggledImage({
    @required this.url,
    this.colorized = true,
  });

  @override
  Widget build(BuildContext context) {
    return colorized
        ? Image.network(url)
        : Image.network(
            url,
            color: Colors.grey,
            colorBlendMode: BlendMode.saturation,
          );
  }
}
