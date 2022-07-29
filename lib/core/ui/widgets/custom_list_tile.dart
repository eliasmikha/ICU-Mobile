import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTile<T> extends StatefulWidget {
  const CustomListTile({
    Key? key,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.gradient,
    this.backgroundColor,
    this.boxShadow,
    this.onTap,
    this.trailingAlignment,
    this.leadingAlignment,
    this.splashColor,
    this.trailingFlex,
    this.leadingFlex,
    this.titleSubtitleSpacing,
    this.validator,
    this.value,
  })  : assert(
          (leadingFlex == null && trailingFlex == null) ||
              (leadingFlex != null &&
                  trailingFlex != null &&
                  leadingFlex + trailingFlex >= 2 &&
                  leadingFlex + trailingFlex <= 9) ||
              (leadingFlex != null && leadingFlex >= 1 && leadingFlex <= 8) ||
              (trailingFlex != null && trailingFlex >= 1 && trailingFlex <= 8),
        ),
        super(key: key);

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Gradient? gradient;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final void Function()? onTap;
  final AlignmentDirectional? trailingAlignment;
  final AlignmentDirectional? leadingAlignment;
  final Color? splashColor;
  final int? trailingFlex;
  final int? leadingFlex;
  final double? titleSubtitleSpacing;
  final String? Function(T? value)? validator;
  final T? value;

  @override
  State<CustomListTile> createState() => CustomListTileState();
}

class CustomListTileState<T> extends State<CustomListTile<T>> {
  String? _errorText;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height != null
          ? widget.height! + (_isValid ? 0 : 40)
          : _isValid
              ? null
              : 40,
      width: widget.width,
      margin: widget.margin,
      child: Column(
        children: [
          Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: widget.border,
              borderRadius: widget.borderRadius,
              gradient: widget.gradient,
              boxShadow: widget.boxShadow,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onTap,
                borderRadius: widget.borderRadius,
                splashColor: widget.splashColor,
                highlightColor: widget.splashColor,
                child: Padding(
                  padding: widget.padding ?? EdgeInsets.zero,
                  child: Row(
                    children: [
                      if (widget.leading != null)
                        Expanded(
                          flex: widget.leadingFlex ?? 2,
                          child: Align(
                            alignment: AlignmentDirectional.center,
                            child: widget.leading,
                          ),
                        ),
                      if (widget.leading != null) 32.horizontalSpace,
                      Expanded(
                        flex: centerFlex,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.title != null) widget.title!,
                            if (widget.titleSubtitleSpacing != null)
                              widget.titleSubtitleSpacing!.verticalSpace,
                            if (widget.subtitle != null) widget.subtitle!,
                          ],
                        ),
                      ),
                      if (widget.trailing != null)
                        Expanded(
                          flex: widget.trailingFlex ?? 2,
                          child: Align(
                            alignment:
                                widget.trailingAlignment ?? Alignment.center,
                            child: widget.trailing,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (!_isValid) 20.verticalSpace,
          if (!_isValid)
            Text(
              _errorText!,
              style: TextStyle(
                color: Colors.red,
                fontSize: 32.sp,
              ),
            ),
        ],
      ),
    );
  }

  /// The current validation error returned by the [CustomListTile.validator]
  /// callback, or null if no errors have been triggered. This only updates when
  /// [validate] is called.
  String? get errorText => _errorText;

  /// True if this widget has any validation errors.
  bool get hasError => _errorText != null;

  bool validate() {
    setState(() {
      _validate();
    });
    return !hasError;
  }

  void _validate() {
    if (widget.validator != null) _errorText = widget.validator!(widget.value);
    _isValid = _errorText == null;
  }

  int get centerFlex {
    //? default flex is 2 if the widget isn't null and its flex is null
    final leadingFlex = widget.leading != null ? widget.leadingFlex ?? 2 : 0;
    final trailingFlex = widget.trailing != null ? widget.trailingFlex ?? 2 : 0;

    if (leadingFlex > 0 && trailingFlex > 0) {
      return 10 - (leadingFlex + trailingFlex);
    } else if (leadingFlex > 0) {
      return 10 - leadingFlex;
    } else if (trailingFlex > 0) {
      return 10 - trailingFlex;
    } else {
      return 10;
    }
  }
}
