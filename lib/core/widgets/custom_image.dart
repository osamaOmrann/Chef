import 'package:chef/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imagePath;
  final double? h;
  final double? w;
  final BoxFit? fit;

  const CustomImage(
      {required this.imagePath, this.h, this.w, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: w,
      height: h,
      fit: fit,
    );
  }
}
