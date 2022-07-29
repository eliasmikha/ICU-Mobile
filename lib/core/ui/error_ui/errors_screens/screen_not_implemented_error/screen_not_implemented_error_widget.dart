part of '../error_widget.dart';

class ScreenNotImplementedErrorWidget extends StatefulWidget {
  final VoidCallback? callback;
  final bool? disableRetryButton;

  const ScreenNotImplementedErrorWidget(
      {Key? key, this.callback, this.disableRetryButton})
      : super(key: key);

  @override
  _ScreenNotImplementedErrorWidgetState createState() =>
      _ScreenNotImplementedErrorWidgetState();
}

class _ScreenNotImplementedErrorWidgetState extends State<ScreenNotImplementedErrorWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildErrorScreen(
      callback: widget.callback,
      context: context,
      disableRetryButton: widget.disableRetryButton ?? false,
      content: "Screen Not Implemented Error",
      icon: Icons.refresh,
      imageUrl: AppConstants.ERROR_INVALID,
      errorAnimation: ErrorAnimation(
        animUrl: AppConstants.ANIM_LOTTIE_ERROR_INVALID,
        animationController: _controller,
      ),
    );
  }
}
