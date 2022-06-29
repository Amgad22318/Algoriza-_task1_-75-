import 'package:flutter/material.dart';

class DefaultAssetImage extends StatelessWidget {
  final String imagePath;
  final BoxFit? fit;
  const DefaultAssetImage({Key? key, required this.imagePath, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: fit,
    );
  }
}
