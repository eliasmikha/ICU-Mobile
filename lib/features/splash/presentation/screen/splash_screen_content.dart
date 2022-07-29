import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app/app_constants.dart';

class SplashScreenContent extends StatefulWidget {
  final Function onAnimationFinished;

  const SplashScreenContent({
    Key? key,
    required this.onAnimationFinished,
  }) : super(key: key);

  @override
  _SplashScreenContentState createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      widget.onAnimationFinished.call();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0.sw,
      height: 1.0.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppConstants.APP_LOGO,
            width: 150,
            height: 150,
          ),
          32.verticalSpace,
          const CircularProgressIndicator(strokeWidth: 2.5),
        ],
      ),
    );
  }
}
