import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starter_application/core/constants/app/app_constants.dart';

enum ShimmerOptions {
  Image,
  Details,
  List,
  ListTile,
}

class CustomShimmer {
  CustomShimmer._();

  static Widget asset(
    String imagePath, {
    Color baseColor = const Color(0xffC4C4C4),
    Color highlightColor = const Color(0xffE8E8E8),
    double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
  }) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit,
        alignment: alignment,
      ),
    );
  }

  static Widget fromOptions(
    ShimmerOptions option, {
    Color baseColor = const Color(0xffC4C4C4),
    Color highlightColor = const Color(0xffE8E8E8),
    Color? backgroundColor,
    double? height,
    double? width,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    int shimmerItemsCount = 1,
    double spacing = 20,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    Duration? period,
    ShimmerDirection? direction,
  }) {
    assert(shimmerItemsCount >= 1, "shimmerItemsCount must be at least 1");
    switch (option) {
      case ShimmerOptions.Image:
        return _buildShimmerList(
          AppConstants.SVG_IMAGE_PLACEHOLDER,
          crossAxisAlignment,
          shimmerItemsCount,
          baseColor,
          highlightColor,
          width,
          height,
          fit,
          alignment,
          spacing,
          period,
          direction,
        );
      case ShimmerOptions.Details:
        return _buildShimmerList(
          AppConstants.SVG_DETAILS_PLACEHOLDER,
          crossAxisAlignment,
          shimmerItemsCount,
          baseColor,
          highlightColor,
          width,
          height,
          fit,
          alignment,
          spacing,
          period,
          direction,
        );
      case ShimmerOptions.List:
        return _buildShimmerList(
          AppConstants.SVG_LIST_PLACEHOLDER,
          crossAxisAlignment,
          shimmerItemsCount,
          baseColor,
          highlightColor,
          width,
          height,
          fit,
          alignment,
          spacing,
          period,
          direction,
        );
      case ShimmerOptions.ListTile:
        return _buildShimmerList(
          AppConstants.SVG_LIST_TILE_PLACEHOLDER,
          crossAxisAlignment,
          shimmerItemsCount,
          baseColor,
          highlightColor,
          width,
          height,
          fit,
          alignment,
          spacing,
          period,
          direction,
        );
    }
  }

  static Widget _buildShimmerList(
    String svgPlaceholderPath,
    CrossAxisAlignment crossAxisAlignment,
    int shimmerItemsCount,
    Color baseColor,
    Color highlightColor,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry alignment,
    double spacing,
    Duration? period,
    ShimmerDirection? direction,
  ) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        for (int i = 0; i < shimmerItemsCount; i++) ...{
          Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            period: period ?? const Duration(milliseconds: 1500),
            direction: direction ?? ShimmerDirection.ltr,
            child: SvgPicture.asset(
              svgPlaceholderPath,
              width: width,
              height: height,
              color: baseColor,
              fit: fit ?? BoxFit.contain,
              alignment: alignment,
            ),
          ),
          if (i + 1 < shimmerItemsCount) spacing.verticalSpace,
        }
      ],
    );
  }
}
