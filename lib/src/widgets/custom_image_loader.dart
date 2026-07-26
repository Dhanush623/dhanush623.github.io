import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageLoader extends StatelessWidget {
  const CustomImageLoader({super.key, required this.imageUrl, this.size = 40});

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return Icon(
        Icons.image_not_supported_outlined,
        size: size,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
    }

    if (imageUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(imageUrl, width: size, height: size);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 4),
      child: Image.asset(imageUrl, width: size, height: size),
    );
  }
}
