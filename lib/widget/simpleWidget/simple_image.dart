import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit/layout/layout_guides.dart';

class SimpleImage extends StatelessWidget {
  final Color? backgroudColor;
  final String? imageName;
  final String? imageURL;

  final File? imageFile;

  final Size? size;
  final BorderRadius? cornerRadius;
  final double? borderWidth;

  final IconData? icon;
  final Color? color;
  final double? iconSize;

  final Color? borderColor;

  final BoxFit? fit;

  const SimpleImage(
      {super.key,
      this.imageName,
      this.imageURL,
      this.size,
      this.cornerRadius,
      this.icon,
      this.color,
      this.iconSize,
      this.backgroudColor,
      this.imageFile,
      this.fit,
      this.borderColor,
      this.borderWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroudColor,
          borderRadius: cornerRadius ?? BorderRadius.circular(0),
          border: Border.all(
              width: borderWidth ?? 0.0,
              color: borderColor ?? Colors.transparent)),
      child: ClipRRect(
        borderRadius: cornerRadius ?? BorderRadius.circular(0),
        child: imageFile != null
            ? Image.file(
                imageFile!,
                width: size?.width,
                height: size?.height,
                fit: fit ?? BoxFit.fill,
              )
            : icon != null
                ? Icon(
                    icon,
                    size: iconSize,
                    color: color,
                  )
                : (imageURL == null
                    ? Image.asset(
                        imageName != null
                            ? 'assets/$imageName'
                            : "assets/defaultHeadImage.png",
                        height: size?.height,
                        width: size?.width,
                        fit: fit ?? BoxFit.fill,
                        color: color,
                      )
                    : getImageFromNet(imageURL ?? "")),
      ),
    );
  }

  Image getImageFromNet(String imageURL) {
    return Image.network(imageURL,
        height: size?.height,
        width: size?.width,
        fit: fit ?? BoxFit.fill,
        color: color, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
      debugPrint("Image loading failed: $exception");
      return Center(
        child: CircularProgressIndicator(
          color: LayoutColor.orangeF57C00,
        ),
      );
    }, loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          color: LayoutColor.orangeF57C00,
        ),
      );
    });
  }
}
