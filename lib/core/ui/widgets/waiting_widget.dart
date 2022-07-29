import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starter_application/core/ui/widgets/custom_shimmer.dart';

enum ProgressIndicatorOption {
  Circular,
  AdaptiveCircular,
  Linear,
}

class WaitingWidget extends StatelessWidget {
  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final double strokeWidth = 4.0;
  final String? semanticsLabel;
  final String? semanticsValue;
  final ProgressIndicatorOption? option;

  const WaitingWidget({
    Key? key,
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (option) {
      case ProgressIndicatorOption.Circular:
        return Center(
          child: CircularProgressIndicator(
            key: key,
            value: value,
            backgroundColor: backgroundColor,
            valueColor: valueColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
      case ProgressIndicatorOption.AdaptiveCircular:
        return Center(
          child: CircularProgressIndicator.adaptive(
            key: key,
            value: value,
            backgroundColor: backgroundColor,
            valueColor: valueColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
      case ProgressIndicatorOption.Linear:
        return Center(
          child: LinearProgressIndicator(
            key: key,
            value: value,
            backgroundColor: backgroundColor,
            valueColor: valueColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
      default:
        return Center(
          child: CircularProgressIndicator.adaptive(
            key: key,
            value: value,
            backgroundColor: backgroundColor,
            valueColor: valueColor,
            semanticsLabel: semanticsLabel,
            semanticsValue: semanticsValue,
          ),
        );
    }
  }

  static Widget wavyText({
    String? loadingMessage,
    TextStyle? textStyle,
    Duration pause = const Duration(milliseconds: 1000),
    Duration speed = const Duration(milliseconds: 300),
    TextAlign textAlign = TextAlign.start,
    bool repeat = true,
    void Function()? onTap,
    void Function(int, bool)? onNext,
    void Function(int, bool)? onNextBeforePause,
    void Function()? onFinished,
  }) {
    return AnimatedTextKit(
      onTap: onTap,
      onNext: onNext,
      onNextBeforePause: onNextBeforePause,
      onFinished: onFinished,
      pause: pause,
      repeatForever: repeat,
      animatedTexts: [
        WavyAnimatedText(
          loadingMessage?.toUpperCase() ?? 'LOADING...',
          textStyle: textStyle ??
              TextStyle(
                color: Colors.black,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
              ),
          speed: speed,
          textAlign: textAlign,
        )
      ],
    );
  }

  static Widget shimmer(
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
    return CustomShimmer.fromOptions(
      option,
      baseColor: baseColor,
      highlightColor: highlightColor,
      backgroundColor: backgroundColor,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      shimmerItemsCount: shimmerItemsCount,
      spacing: spacing,
      crossAxisAlignment: crossAxisAlignment,
      period: period,
      direction: direction,
    );
  }
}
