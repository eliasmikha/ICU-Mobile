import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starter_application/core/errors/app_errors.dart';
import 'package:starter_application/core/results/result.dart';
import 'package:starter_application/core/ui/widgets/waiting_widget.dart';
import 'package:starter_application/generated/l10n.dart';

class CustomDropdown<T> extends StatefulWidget {
  /// List of items to be shown in the dropdown without the hastle of
  /// the
  /// ```dart
  /// DropdownMenuItem<T>
  /// ```
  /// and it is prefered to be of type `String`
  final List<T>? dropdownItems;

  /// This is a builder for the dropdown items if the user want
  /// complex design for the items and not only a title
  ///
  /// example:
  /// ```dart
  /// CustomDropdown(
  ///   dropdownItemBuilder: (object) {
  ///
  ///     // your custom widget goes here
  ///
  ///     // example:
  ///     return Row(
  ///       children: [
  ///         Image.network(object.imageUrl),
  ///         Text(object.title),
  ///       ],
  ///     );
  ///   }
  /// );
  /// ```
  final Widget Function(T? object)? dropdownItemBuilder;

  /// This function helps the user to customize the showing title
  /// in the dropdown items in case of complex objects
  final String Function(T? object)? stringTitleGetter;
  final Widget? hint;
  final Widget? disabledHint;
  final ValueChanged<T?>? onChanged;
  final void Function()? onTap;
  final int elevation;
  final TextStyle? style;
  final Widget? underline;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize;
  final bool isDense;
  final bool isExpanded;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;
  final bool autofocus;
  final Color? dropdownColor;
  final double? menuMaxHeight;
  final bool? enableFeedback;
  final AlignmentGeometry alignment;
  final InputDecoration? decoration;
  final void Function(T? value)? onSaved;
  final String? Function(T? value)? validator;
  final Future<Result<AppErrors, List<T>>> Function()? itemGetterFromApi;
  final InputBorder? border,
      errorBorder,
      enabledBorder,
      focusedBorder,
      disabledBorder,
      focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  final ValueNotifier<T?> dropdownValue;

  const CustomDropdown({
    Key? key,
    required this.dropdownItems,
    this.dropdownItemBuilder,
    this.stringTitleGetter,
    this.contentPadding,
    this.hint,
    this.disabledHint,
    this.onChanged,
    this.onTap,
    this.elevation = 8,
    this.style,
    this.underline,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.iconSize = 24.0,
    this.isDense = false,
    this.isExpanded = false,
    this.itemHeight,
    this.focusColor,
    this.focusNode,
    this.autofocus = false,
    this.dropdownColor,
    this.menuMaxHeight,
    this.enableFeedback,
    this.alignment = AlignmentDirectional.centerStart,
    this.decoration,
    this.onSaved,
    this.validator,
    this.itemGetterFromApi,
    this.border,
    this.errorBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    required this.dropdownValue,
  })  : assert(
          (dropdownItems != null) ^ (itemGetterFromApi != null),
          "(dropdownItems or itemGetterFromApi) must be null "
          "you can't provide both of them",
        ),
        super(key: key);

  @override
  State<CustomDropdown<T>> createState() => CustomDropdownState<T>();
}

class CustomDropdownState<T> extends State<CustomDropdown<T>> {
  // T? _selectedValue;
  List<T>? _dropdownItems;
  bool _isLoading = false;
  bool _isError = false;
  String? _error;
  GlobalKey dropdownKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _dropdownItems = widget.dropdownItems;

    if (widget.itemGetterFromApi != null) {
      _isLoading = true;
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          widget.itemGetterFromApi?.call().then(
                (result) => onDataFetched(result),
              );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.dropdownValue,
      builder: (context, _, __) {
        return DropdownButtonFormField<T>(
          key: dropdownKey,
          value: widget.dropdownValue.value,
          items: _getDropdownItems(),
          onChanged: (value) {
            widget.onChanged?.call(value);
            widget.dropdownValue.value = value;
          },
          alignment: widget.alignment,
          dropdownColor: widget.dropdownColor,
          hint: _isLoading
              ? WaitingWidget.wavyText()
              : _isError
                  ? Text(
                      _error!,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    )
                  : widget.hint,
          icon: _isLoading
              ? _buildLoadingButton()
              : _isError
                  ? _buildErrorButton()
                  : widget.icon,
          iconSize: widget.iconSize,
          iconEnabledColor: widget.iconEnabledColor,
          iconDisabledColor: widget.iconDisabledColor,
          itemHeight: widget.itemHeight,
          menuMaxHeight: widget.menuMaxHeight,
          style: widget.style,
          validator: widget.validator,
          onSaved: widget.onSaved,
          decoration: widget.decoration ??
              InputDecoration(
                contentPadding: widget.contentPadding ??
                    EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 50.w,
                    ),
                border: widget.border ?? _getBorder(),
                errorBorder: widget.errorBorder ??
                    widget.border?.copyWith(
                        borderSide: widget.border?.borderSide
                            .copyWith(color: Colors.red)) ??
                    _getErrorBorder(),
                enabledBorder:
                    widget.enabledBorder ?? widget.border ?? _getBorder(),
                focusedBorder:
                    widget.focusedBorder ?? widget.border ?? _getBorder(),
                disabledBorder:
                    widget.disabledBorder ?? widget.border ?? _getBorder(),
                focusedErrorBorder: widget.focusedErrorBorder ??
                    widget.errorBorder ??
                    widget.border?.copyWith(
                        borderSide: widget.border?.borderSide
                            .copyWith(color: Colors.red)) ??
                    _getErrorBorder(),
                // suffixIcon: _selectedValue != null
                //     ? IconButton(
                //         icon: const Icon(
                //           Icons.close_rounded,
                //           color: Colors.red,
                //         ),
                //         onPressed: () {
                //           setState(() {
                //             _selectedValue = null;
                //           });
                //         },
                //       )
                //     : null,
              ),
          enableFeedback: widget.enableFeedback,
          autofocus: widget.autofocus,
          focusNode: widget.focusNode,
          focusColor: widget.focusColor,
          disabledHint: widget.disabledHint,
          elevation: widget.elevation,
          isDense: widget.isDense,
          isExpanded: widget.isExpanded,
        );
      },
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    );
  }

  OutlineInputBorder _getErrorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget _buildLoadingButton() {
    return const WaitingWidget(
      option: ProgressIndicatorOption.AdaptiveCircular,
    );
  }

  Widget _buildErrorButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isLoading = true;
        });
        widget.itemGetterFromApi
            ?.call()
            .then((result) => onDataFetched(result));
      },
      icon: const Icon(
        Icons.refresh,
        color: Colors.red,
      ),
    );
  }

  List<DropdownMenuItem<T>>? _getDropdownItems() {
    return [
      if (_dropdownItems != null)
        ..._dropdownItems!
            .map(
              (e) => DropdownMenuItem<T>(
                value: e,
                alignment: widget.alignment,
                child: widget.dropdownItemBuilder?.call(e) ??
                    Text(
                      widget.stringTitleGetter?.call(e) ?? e.toString().trim(),
                      style: widget.style,
                    ),
              ),
            )
            .toList(),
    ];
  }

  void onDataFetched(Result<AppErrors, List<T>> result) {
    result.pick(
      onData: (data) {
        setState(() {
          _isLoading = false;
          _isError = false;
          _dropdownItems = data;
          _error = null;
        });
      },
      onError: (error) {
        setState(() {
          _isLoading = false;
          _isError = true;
          _dropdownItems = null;
          _error = S.current.failedRefresher;
        });
      },
    );
  }

  @override
  void dispose() {
    dropdownKey.currentState?.dispose();
    widget.dropdownValue.dispose();
    super.dispose();
  }
}
