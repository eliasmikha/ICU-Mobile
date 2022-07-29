import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../../../../common/app_config.dart';
part 'animated_section.dart';
part 'dropdown_field.dart';
part 'dropdown_overlay.dart';
part 'overlay_builder.dart';

class CustomSearchDropdown<T> extends StatefulWidget {
  final bool enabled;
  final List<DropdownMenuItem<T>> items;
  final String Function(T) getStringFromItem;
  final VoidCallback? onTap;
  final Widget? hint;
  final String? hintText;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Widget suffixIcon;
  final ValueChanged<T?> onChanged;
  final Color? fillColor;
  final bool? canCloseOutsideBounds;
  final EdgeInsetsGeometry? contentPadding;
  final double? menuBorderRadius;
  final EdgeInsetsGeometry menuHeaderPadding;
  final EdgeInsetsGeometry menuItemsPadding;
  final Color? menuBackgroundColor;
  final Color? menuIconColor;
  final VoidCallback? onSearchTap;
  final String? Function(T?)? validator;

  CustomSearchDropdown({
    Key? key,
    this.enabled = true,
    required this.items,
    required this.getStringFromItem,
    required this.hintText,
    required this.onChanged,
    this.hint,
    this.onTap,
    this.hintStyle,
    this.border,
    this.enableBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.suffixIcon =
        const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
    this.canCloseOutsideBounds = false,
    this.fillColor = Colors.white,
    this.contentPadding,
    this.menuBorderRadius,
    this.menuHeaderPadding =
        const EdgeInsets.only(left: 16.0, top: 16, bottom: 16, right: 14),
    this.menuItemsPadding =
        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.menuBackgroundColor,
    this.menuIconColor,
    this.onSearchTap,
    this.validator,
  })  : assert(!(hint != null && hintText != null)),
        super(key: key);

  @override
  State<CustomSearchDropdown<T>> createState() => CustomSearchDropdownState();
}

class CustomSearchDropdownState<T> extends State<CustomSearchDropdown<T>> {
  final layerLink = LayerLink();
  final _selectValueNotifier = ValueNotifier<T?>(null);
  final _overlayWidgetKey = GlobalKey<DropdownOverlayState>();

  @override
  Widget build(BuildContext context) {
    return _OverlayBuilder(
      overlay: (size, hideCallback) {
        return _DropdownOverlay<T>(
          key: _overlayWidgetKey,
          selectValueNotifier: _selectValueNotifier,
          items: widget.items,
          getStringFromItem: widget.getStringFromItem,
          size: size,
          layerLink: layerLink,
          hideOverlay: hideCallback,
          headerHintText: widget.hintText ?? '',
          canCloseOutsideBounds: widget.canCloseOutsideBounds,
          borderRadius: widget.menuBorderRadius,
          listItemPadding: widget.menuItemsPadding,
          headerPadding: widget.menuHeaderPadding,
          overlayOuterPadding:
              const EdgeInsets.only(bottom: 12, left: 5, right: 5),
          onSearchTap: widget.onSearchTap,
          backgroundColor: widget.menuBackgroundColor,
          iconColor: widget.menuIconColor,
        );
      },
      child: (showCallback) {
        return CompositedTransformTarget(
          link: layerLink,
          child: _DropDownField(
            enabled: (_overlayWidgetKey.currentState?.displayOverly ?? false)
                ? false
                : widget.enabled,
            selectValueNotifier: _selectValueNotifier,
            items: widget.items,
            onTap: () {
              showCallback.call();
              widget.onTap?.call();
            },
            onChanged: widget.onChanged,
            validator: widget.validator,
            icon: widget.suffixIcon,
            border: widget.border ?? getBorder(),
            enableBorder: widget.enableBorder ?? getBorder(),
            disabledBorder: widget.disabledBorder ?? getBorder(),
            focusedBorder: widget.focusedBorder ?? getBorder(),
            errorBorder: widget.errorBorder ?? getErrorBorder(),
            focusedErrorBorder: widget.focusedErrorBorder ?? getErrorBorder(),
            hint: widget.hint,
            fillColor: widget.fillColor,
            contentPadding: widget.contentPadding,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _selectValueNotifier.dispose();
    super.dispose();
  }

  ValueNotifier<T?> get selectValueNotifier => _selectValueNotifier;
  GlobalKey<DropdownOverlayState> get overlayWidgetKey => _overlayWidgetKey;

  InputBorder getBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(0),
    );
  }

  InputBorder getErrorBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(0),
    );
  }
}
