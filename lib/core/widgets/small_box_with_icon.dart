import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovative_net_test/core/extensions/widget_ext/widget_extensions.dart';
import 'package:innovative_net_test/core/widgets/app_image_view.dart';

class SmallBoxWithIcon extends StatelessWidget {
  final double? height;
  final double? width;
  final double? padding;
  final IconData? icon;
  final double? iconSize;
  final Size? imageSize;
  final String? imagePath;
  final Color? iconColor;
  final Color? imageColor;
  final Color? boxColor;
  final double? radius;

  const SmallBoxWithIcon({
    super.key,
    this.imagePath,
    this.icon,
    this.iconColor,
    this.imageColor,
    this.height,
    this.width,
    this.padding,
    this.iconSize,
    this.imageSize,
    this.boxColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all((padding ?? 8).r),
      height: height,
      width: width,
      color: boxColor,
      child: icon == null
          ? imagePath != null
                ? Center(
                    child: AppImageView(
                      imagePath: imagePath!,
                      imageSize: imageSize,
                      color: imageColor,
                    ),
                  )
                : null
          : Center(
              child: Icon(icon, size: iconSize, color: iconColor),
            ),
    ).roundedCorner(radius ?? 24.r);
  }
}
