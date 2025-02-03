import 'package:flutter/material.dart';
import 'package:chondohealth/util/constants/default_values.dart';
import 'package:chondohealth/util/constants/dimension_theme.dart';

class WImageNetwork extends StatelessWidget {
  final String? imagePath;
  final String? errorImage;
  final double? height, width;
  final BoxFit? fit;
  final bool? isCircular;
  const WImageNetwork({super.key, this.imagePath, this.errorImage, this.height, this.width, this.fit, this.isCircular});

  @override
  Widget build(BuildContext context) {
    return isCircular == true
        ? Container(
            height: height ?? PTheme.imageDefaultX,
            width: width ?? PTheme.imageDefaultX,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imagePath ?? PDefaultValues.noImage),
                onError: (exception, stackTrace) {
                  NetworkImage(errorImage ?? PDefaultValues.noImage);
                },
              ),
            ),
          )
        : Image.network(
            imagePath ?? PDefaultValues.noImage,
            height: height ?? PTheme.imageDefaultX,
            width: width ?? PTheme.imageDefaultX,
            fit: fit,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return Image.network(
                errorImage ?? PDefaultValues.noImage,
                height: PTheme.imageDefaultX,
                width: PTheme.imageDefaultX,
              );
            },
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                      : null,
                ),
              );
            },
          );
  }
}
