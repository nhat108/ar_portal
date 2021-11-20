import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CacheImageNetworkWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit boxFit;
  final Color? customColor;

  final Widget? errorWidget;
  const CacheImageNetworkWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.boxFit = BoxFit.cover,
    this.errorWidget,
    this.customColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        color: customColor,
        placeholderFadeInDuration: Duration.zero,
        errorWidget: (_, __, ___) {
          return errorWidget ??
              Container(
                height: height,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(borderRadius)),
              );
        },
        width: width,
        height: height,
        fit: boxFit,
      ),
    );
  }
}
